import { type LucideIcon } from "lucide-react";
import { FileRoutesByTo } from "@/routeTree.gen";

export type MenuItem = {
    title: string;
    url: keyof FileRoutesByTo;
    icon?: LucideIcon;
    isActive?: boolean;
    items?: {
        title: string;
        url: keyof FileRoutesByTo;
    }[];
};

export type NavItems = {
    user: {
        name: string;
        email: string;
        avatar: string;
        logout: () => void;
    };
    teams: Array<{
        name: string;
        logo: LucideIcon;
        plan: string;
    }>;
    navMain: Array<MenuItem>;
    projects: Array<{
        name: string;
        url: string;
        icon: LucideIcon;
    }>;
};
