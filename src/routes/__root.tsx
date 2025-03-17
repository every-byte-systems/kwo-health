import { Outlet, createRootRouteWithContext } from "@tanstack/react-router";
import type { QueryClient } from "@tanstack/react-query";
import { TanStackRouterDevtools } from "@tanstack/react-router-devtools";
import { Auth } from "../utils/auth";

export const Route = createRootRouteWithContext<{
    auth: Auth;
    queryClient: QueryClient;
}>()({
    component: RootComponent,
});

function RootComponent() {
    return (
        <div className="h-screen w-screen flex items-center justify-center">
            <Outlet />
            <TanStackRouterDevtools />
        </div>
    );
}
