import { StrictMode } from "react";
import * as ReactDOM from "react-dom/client";
import {
    RouterProvider,
    createRouter,
    ErrorComponent,
} from "@tanstack/react-router";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Surreal } from "surrealdb";
import { type ConnectFn, SurrealDbProvider } from "./contexts/SurrealProvider";

// Import the generated route tree
import { routeTree } from "./routeTree.gen";

import { DB, NS, SURREAL_ENDPOINT } from "./constants/db";
import { ACCESS_TOKEN } from "./constants/storage";

import { auth } from "./utils/auth";

import "./index.css";

// Create a new router instance
export const queryClient = new QueryClient();

const router = createRouter({
    routeTree,
    defaultPendingComponent: () => <div className={`p-2 text-2xl`}></div>,
    defaultErrorComponent: ({ error }) => <ErrorComponent error={error} />,
    context: {
        auth: undefined!, // We'll inject this when we render
        queryClient,
    },
    defaultPreload: "intent",
    // Since we're using React Query, we don't want loader calls to ever be stale
    // This will ensure that the loader is always called when the route is preloaded or visited
    defaultPreloadStaleTime: 0,
    scrollRestoration: true,
});
// Register the router instance for type safety
declare module "@tanstack/react-router" {
    interface Register {
        router: typeof router;
    }
}

const surrealClient = new Surreal();

function App() {
    const connect: ConnectFn = async ({ client, endpoint, params }) => {
        await client.connect(endpoint, params);
        const token = localStorage.getItem(ACCESS_TOKEN);
        if (token) {
            try {
                await client.authenticate(token);
                auth.status = "loggedIn";
            } catch (e) {
                localStorage.removeItem(ACCESS_TOKEN);
                console.error(e);
            }
        }
    };

    return (
        <SurrealDbProvider
            client={surrealClient}
            endpoint={SURREAL_ENDPOINT}
            params={{ namespace: NS, database: DB }}
            connectFn={connect}
        >
            <RouterProvider
                router={router}
                context={{
                    auth,
                }}
            />
        </SurrealDbProvider>
    );
}

const root = ReactDOM.createRoot(
    document.getElementById("root") as HTMLElement,
);

root.render(
    <StrictMode>
        <QueryClientProvider client={queryClient}>
            <App />
        </QueryClientProvider>
    </StrictMode>,
);
