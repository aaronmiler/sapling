import { useQuery } from "@tanstack/react-query"

import { apiPings } from "../lib/routes"
import type { Ping } from "../types"

// Demo of the full chain: Rails route → Blueprint → js_from_routes → react-query.
// Replace with real views once the app has real API resources.
const App = () => {
  const { data, isPending, isError } = useQuery({
    queryKey: ["pings"],
    queryFn: () => apiPings.index<Ping>(),
  })

  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-2">
      <h1 className="text-2xl font-semibold text-gray-900">Rails + Vite + React starter</h1>
      <p className="text-sm text-gray-500">
        {isPending && "Pinging /api/pings…"}
        {isError && "API unreachable"}
        {data && `API says "${data.message}" at ${data.servedAt}`}
      </p>
    </main>
  )
}

export default App
