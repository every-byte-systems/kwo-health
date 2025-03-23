import {
    createQueryKeys,
    mergeQueryKeys,
} from "@lukemorales/query-key-factory";

const conceptKeys = createQueryKeys("concepts", {
    current: {
        queryKey: null,
        contextQueries: {
            presence: {
                queryKey: null,
                contextQueries: {
                    live: {
                        queryKey: null,
                    },
                },
            },
        },
    },
});

export const queryKeys = mergeQueryKeys(conceptKeys);
