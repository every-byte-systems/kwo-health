import type { QueryClient } from "@tanstack/react-query";
import { Outlet, createRootRouteWithContext } from "@tanstack/react-router";
import { Auth } from "../utils/auth";

export const Route = createRootRouteWithContext<{
    auth: Auth;
    queryClient: QueryClient;
}>()({
    component: () => <Outlet />,
});
