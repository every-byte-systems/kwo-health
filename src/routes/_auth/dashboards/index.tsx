import { createFileRoute } from '@tanstack/react-router'

export const Route = createFileRoute('/_auth/dashboards/')({
  component: RouteComponent,
})

function RouteComponent() {
  return <div>Hello "/_auth/dashboard/"!</div>
}
