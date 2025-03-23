import { useSurrealDbClient } from "@/contexts/SurrealProvider";
import { MissingAuthenticationError } from "@/lib/errors";
import { fhirR5 } from "@smile-cdr/fhirts";

import concepts from "@/queries/concepts.surql?raw";
import { useSuspenseQuery } from "@tanstack/react-query";

export const useConcepts = () => {
    const dbClient = useSurrealDbClient();

    const getConcepts = async () => {
        const response = await dbClient?.query<[fhirR5.CodeSystem[]]>(concepts);

        console.log(response);

        if (!response?.[0]) {
            throw new MissingAuthenticationError();
        }
        return response[0];
    };
    return useSuspenseQuery({
        queryKey: [],
        queryFn: getConcepts,
        retry: false,
    });
};
