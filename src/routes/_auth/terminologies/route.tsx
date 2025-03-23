import { createFileRoute, Link, Outlet } from "@tanstack/react-router";

export const Route = createFileRoute("/_auth/terminologies")({
    component: RouteComponent,
});

function RouteComponent() {
    return (
        <div>
            <div>
                <Link to="/terminologies">Concepts</Link>
            </div>
            <Outlet />
        </div>
    );
}
