import {
    createFormHook,
    createFormHookContexts,
    AnyFieldApi,
} from "@tanstack/react-form";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import {
    createFileRoute,
    useLayoutEffect,
    useRouter,
} from "@tanstack/react-router";
import { z } from "zod";
import { useSurrealDbClient } from "@/contexts/SurrealProvider";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { DB, NS, USER_ACCESS } from "@/constants/db";
import { ACCESS_TOKEN } from "@/constants/storage";

type SigninMutationProps = {
    email: string;
    password: string;
};
const { fieldContext, formContext } = createFormHookContexts();

const { useAppForm } = createFormHook({
    fieldComponents: {
        Input,
    },
    formComponents: {
        Button,
    },
    fieldContext,
    formContext,
});

function FieldInfo({ field }: { field: AnyFieldApi }) {
    return (
        <>
            {field.state.meta.isTouched && field.state.meta.errors.length ? (
                <em>
                    {field.state.meta.errors
                        .map(({ message }) => message)
                        .join(" ")}
                </em>
            ) : null}
            {field.state.meta.isValidating ? "Validating..." : null}
        </>
    );
}

export const Route = createFileRoute("/login")({
    validateSearch: z.object({
        redirect: z.string().optional(),
    }),
    component: RouteComponent,
});

function RouteComponent() {
    const form = useAppForm({
        defaultValues: {
            username: "",
            password: "",
        },
        validators: {
            onChange: z.object({
                username: z.string().min(3),
                password: z.string().min(3),
            }),
        },
        onSubmit: async ({ value }) => {
            await signin.mutateAsync({
                email: value.username,
                password: value.password,
            });
        },
    });
    const router = useRouter();
    const { auth, status } = Route.useRouteContext({
        select: ({ auth }) => ({ auth, status: auth.status }),
    });
    const queryClient = useQueryClient();
    const dbClient = useSurrealDbClient();
    const search = Route.useSearch();
    useLayoutEffect(() => {
        if (status === "loggedIn" && search.redirect) {
            router.history.push(search.redirect);
        }
    }, [status, search.redirect]);

    const signin = useMutation({
        mutationKey: ["signin"],
        mutationFn: async (variables: SigninMutationProps) => {
            const token = await dbClient?.signin({
                namespace: NS,
                database: DB,
                access: USER_ACCESS,
                variables,
            });
            if (token) {
                localStorage.setItem(ACCESS_TOKEN, token);
                auth.status = "loggedIn";
            }

            return !!token;
        },
        onSettled: () => {
            queryClient.resetQueries({
                queryKey: [],
            });
        },
    });
    return (
        <div className="flex items-center justify-center h-full">
            <form
                onSubmit={(e) => {
                    e.preventDefault();
                    form.handleSubmit();
                }}
                className="flex flex-col gap-5 w-96"
            >
                <form.AppField
                    name="username"
                    children={(field) => {
                        return (
                            <>
                                <label htmlFor={field.name}>Username:</label>
                                <field.Input
                                    id={field.name}
                                    name={field.name}
                                    value={field.state.value}
                                    onBlur={field.handleBlur}
                                    onChange={(e) =>
                                        field.handleChange(e.target.value)
                                    }
                                />
                                <FieldInfo field={field} />
                            </>
                        );
                    }}
                />
                <form.AppField
                    name="password"
                    children={(field) => {
                        return (
                            <>
                                <label htmlFor={field.name}>Password:</label>
                                <field.Input
                                    id={field.name}
                                    name={field.name}
                                    value={field.state.value}
                                    onBlur={field.handleBlur}
                                    onChange={(e) =>
                                        field.handleChange(e.target.value)
                                    }
                                    type="password"
                                />
                                <FieldInfo field={field} />
                            </>
                        );
                    }}
                />
                <form.AppForm>
                    <form.Button>Login</form.Button>
                </form.AppForm>
            </form>
        </div>
    );

    // return status === "loggedIn" ? (
    //     <div>
    //         Logged in as <strong>{auth.username}</strong>
    //         <div className="h-2" />
    //         <button
    //             onClick={() => {
    //                 auth.logout();
    //                 router.invalidate();
    //             }}
    //             className="text-sm bg-blue-500 text-white border inline-block py-1 px-2 rounded"
    //         >
    //             Log out
    //         </button>
    //         <div className="h-2" />
    //     </div>
    // ) : (

    // );
}
