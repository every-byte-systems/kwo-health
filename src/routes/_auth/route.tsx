import { ACCESS_TOKEN } from "@/constants/storage";
import {
    createFileRoute,
    Outlet,
    redirect,
    useRouter,
} from "@tanstack/react-router";
import { GalleryVerticalEnd, SquareTerminal } from "lucide-react";

import { useSurrealDbClient } from "@/contexts/SurrealProvider";
import { useMutation, useQueryClient } from "@tanstack/react-query";

import { auth } from "@/utils/auth";

import { AppSidebar } from "@/components/app-sidebar";
import {
    Breadcrumb,
    BreadcrumbItem,
    BreadcrumbLink,
    BreadcrumbList,
    BreadcrumbPage,
    BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { Separator } from "@/components/ui/separator";
import {
    SidebarInset,
    SidebarProvider,
    SidebarTrigger,
} from "@/components/ui/sidebar";

import { NavUser } from "@/components/nav-user";
import { NavItems } from "@/interfaces";
import { camelCase, startCase } from "lodash";
export const Route = createFileRoute("/_auth")({
    component: RouteComponent,
    beforeLoad: ({ context, location }) => {
        if (context.auth.status === "loggedOut") {
            throw redirect({
                to: "/login",
                search: {
                    redirect: location.href,
                },
            });
        }
        return {
            username: auth.username,
        };
    },
});

function RouteComponent() {
    const router = useRouter();
    const queryClient = useQueryClient();
    const dbClient = useSurrealDbClient();

    const { state } = useRouter();

    const currentPath = state.location.pathname;
    const segments = currentPath.split("/").filter(Boolean);

    let pathAccumulator = "";
    const breadcrumbs = segments.map((segment) => {
        pathAccumulator += `/${segment}`;
        return { name: segment, path: pathAccumulator };
    });

    const signout = useMutation({
        mutationKey: ["signout"],
        mutationFn: async () => {
            localStorage.removeItem(ACCESS_TOKEN);
            await dbClient?.invalidate();
            return true;
        },
        onSettled: () => {
            queryClient.resetQueries();
        },
    });

    const handleSignOut = async () => {
        await signout.mutateAsync();
        auth.logout();
        router.invalidate();
    };

    const data: NavItems = {
        user: {
            name: "carapai",
            email: "carapai@everybyte.com",
            avatar: "/avatars/shadcn.jpg",
            logout: handleSignOut,
        },
        teams: [
            {
                name: "Kwo Health",
                logo: GalleryVerticalEnd,
                plan: "Enterprise",
            },
        ],
        navMain: [
            {
                title: "Terminologies",
                url: "/",
                icon: SquareTerminal,
                isActive: true,
                items: [
                    {
                        title: "Concepts",
                        url: "/terminologies/concepts",
                    },
                    {
                        title: "Code Systems",
                        url: "/terminologies/code_systems",
                    },
                    {
                        title: "Concept Maps",
                        url: "/terminologies/concept_maps",
                    },
                ],
            },
        ],
        projects: [],
    };
    return (
        <SidebarProvider>
            <AppSidebar items={data} />
            <SidebarInset>
                <header className="flex h-16 shrink-0 items-center justify-between gap-2 transition-[width,height] ease-linear group-has-[[data-collapsible=icon]]/sidebar-wrapper:h-12">
                    <div className="flex items-center gap-2 px-4">
                        <SidebarTrigger className="-ml-1" />
                        <Separator
                            orientation="vertical"
                            className="mr-2 h-4"
                        />
                        <Breadcrumb>
                            <BreadcrumbList>
                                {breadcrumbs.map((crumb, index) => {
                                    if (index === breadcrumbs.length - 1) {
                                        return (
                                            <BreadcrumbItem>
                                                <BreadcrumbPage>
                                                    {startCase(
                                                        camelCase(crumb.name),
                                                    )}
                                                </BreadcrumbPage>
                                            </BreadcrumbItem>
                                        );
                                    }
                                    return (
                                        <>
                                            <BreadcrumbItem className="hidden md:block">
                                                <BreadcrumbLink
                                                    href={crumb.path}
                                                >
                                                    {startCase(
                                                        camelCase(crumb.name),
                                                    )}
                                                </BreadcrumbLink>
                                            </BreadcrumbItem>
                                            <BreadcrumbSeparator className="hidden md:block" />
                                        </>
                                    );
                                })}
                            </BreadcrumbList>
                        </Breadcrumb>
                    </div>
                    <div className="self-end">
                        <NavUser user={data.user} />
                    </div>
                </header>
                <div className="flex flex-1 flex-col gap-4 p-4 pt-0">
                    <div className="min-h-[100vh] flex-1 rounded-xl bg-muted/50 md:min-h-min">
                        <Outlet />
                    </div>
                </div>
            </SidebarInset>
        </SidebarProvider>
    );
}
