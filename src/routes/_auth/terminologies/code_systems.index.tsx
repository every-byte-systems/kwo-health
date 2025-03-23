import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/_auth/terminologies/code_systems/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/_auth/terminologies/code_systems"!</div>
}
