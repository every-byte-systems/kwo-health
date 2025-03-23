import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/_auth/terminologies/concepts/$id')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/terminology/concepts/$id"!</div>
}
