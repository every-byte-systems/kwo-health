import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/_auth/terminologies/concept_maps/")({
    component: RouteComponent,
});
function RouteComponent() {
    return <div>Hello "/_auth/terminologies/concept_maps"!</div>;
}
