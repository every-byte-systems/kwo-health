import { createFileRoute, redirect, useRouter } from "@tanstack/react-router";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { useSurrealDbClient } from "@/contexts/SurrealProvider";

import { ACCESS_TOKEN } from "@/constants/storage";

import { auth } from "../utils/auth";
export const Route = createFileRoute("/")({
    component: RouteComponent,
    beforeLoad: ({ context, location }) => {
        if (context.auth.status === "loggedOut") {
            throw redirect({
                to: "/login",
                search: {
                    redirect: location.href,
                },
            });
        }
        return {
            username: auth.username,
        };
    },
});

function RouteComponent() {
    const router = useRouter();

    const queryClient = useQueryClient();
    const dbClient = useSurrealDbClient();

    const signout = useMutation({
        mutationKey: ["signout"],
        mutationFn: async () => {
            localStorage.removeItem(ACCESS_TOKEN);
            await dbClient?.invalidate();
            return true;
        },
        onSettled: () => {
            queryClient.resetQueries();
        },
    });

    const handleSignOut = async () => {
        await signout.mutateAsync();
        auth.logout();
        router.invalidate();
    };

    return (
        <div className="bg-yellow-200">
            <button
                onClick={handleSignOut}
                className="text-sm bg-blue-500 text-white border inline-block py-1 px-2 rounded"
            >
                Log out
            </button>
        </div>
    );
}
