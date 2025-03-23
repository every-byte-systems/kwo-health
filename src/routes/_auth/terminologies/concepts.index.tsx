import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/_auth/terminologies/concepts/")({
    component: RouteComponent,
});

function RouteComponent() {
    return <div>Hello "/terminology/concepts/"!</div>;
}
