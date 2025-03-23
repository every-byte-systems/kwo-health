import * as React from "react";

import { NavMain } from "@/components/nav-main";
import { NavProjects } from "@/components/nav-projects";
import { TeamSwitcher } from "@/components/team-switcher";
import {
    Sidebar,
    SidebarContent,
    SidebarHeader,
    SidebarRail,
} from "@/components/ui/sidebar";
import { NavItems } from "@/interfaces";

export function AppSidebar({
    items,
    ...props
}: React.ComponentProps<typeof Sidebar> & { items: NavItems }) {
    return (
        <Sidebar collapsible="icon" {...props}>
            <SidebarHeader>
                <TeamSwitcher teams={items.teams} />
            </SidebarHeader>
            <SidebarContent>
                <NavMain items={items.navMain} />
                <NavProjects projects={items.projects} />
            </SidebarContent>
            <SidebarRail />
        </Sidebar>
    );
}
