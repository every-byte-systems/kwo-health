import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/_auth/terminologies/concept_maps/$id')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/_auth/terminologies/concept_maps/$id"!</div>
}
