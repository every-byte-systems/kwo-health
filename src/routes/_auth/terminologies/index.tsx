import { useConcepts } from "@/modules/terminology/api/concepts";
import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/_auth/terminologies/")({
    component: RouteComponent,
});

function RouteComponent() {
    const { data } = useConcepts();
    return <div>{JSON.stringify(data, null, 2)}</div>;
}
