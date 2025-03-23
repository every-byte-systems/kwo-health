import {
    createFormHook,
    createFormHookContexts,
    AnyFieldApi,
} from "@tanstack/react-form";
import { useMutation, useQueryClient } from "@tanstack/react-query";

import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { DB, NS, USER_ACCESS } from "@/constants/db";
import { ACCESS_TOKEN } from "@/constants/storage";
import { useSurrealDbClient } from "@/contexts/SurrealProvider";
import { Auth } from "@/utils/auth";

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

export function LoginForm({
    className,
    auth,
    ...props
}: React.ComponentProps<"div"> & { auth: Auth }) {
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
    const form = useAppForm({
        defaultValues: {
            username: "",
            password: "",
        },
        onSubmit: async ({ value }) => {
            await signin.mutateAsync({
                email: value.username,
                password: value.password,
            });
        },
    });

    const queryClient = useQueryClient();
    const dbClient = useSurrealDbClient();
    return (
        <div className={cn("flex flex-col gap-6", className)} {...props}>
            <Card>
                <CardHeader>
                    <CardTitle>Login to your account</CardTitle>
                    <CardDescription>
                        Enter your email below to login to your account
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form
                        onSubmit={(e) => {
                            e.preventDefault();
                            form.handleSubmit();
                        }}
                    >
                        <div className="flex flex-col gap-6">
                            <form.AppField
                                name="username"
                                children={(field) => {
                                    return (
                                        <div className="grid gap-3">
                                            <label htmlFor={field.name}>
                                                Username:
                                            </label>
                                            <field.Input
                                                id={field.name}
                                                name={field.name}
                                                value={field.state.value}
                                                onBlur={field.handleBlur}
                                                onChange={(e) =>
                                                    field.handleChange(
                                                        e.target.value,
                                                    )
                                                }
                                            />
                                            <FieldInfo field={field} />
                                        </div>
                                    );
                                }}
                            />

                            <form.AppField
                                name="password"
                                children={(field) => {
                                    return (
                                        <div className="grid gap-3">
                                            <div className="flex items-center">
                                                <Label htmlFor={field.name}>
                                                    Password:
                                                </Label>
                                                <a
                                                    href="#"
                                                    className="ml-auto inline-block text-sm underline-offset-4 hover:underline"
                                                >
                                                    Forgot your password?
                                                </a>
                                            </div>
                                            <field.Input
                                                id={field.name}
                                                name={field.name}
                                                value={field.state.value}
                                                onBlur={field.handleBlur}
                                                onChange={(e) =>
                                                    field.handleChange(
                                                        e.target.value,
                                                    )
                                                }
                                                type="password"
                                            />
                                        </div>
                                    );
                                }}
                            />
                            <form.AppForm>
                                <div className="flex flex-col gap-3">
                                    <form.Button
                                        type="submit"
                                        className="w-full"
                                    >
                                        Login
                                    </form.Button>
                                </div>
                            </form.AppForm>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    );
}
