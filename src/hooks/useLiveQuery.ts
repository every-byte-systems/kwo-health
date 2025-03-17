import { useSurrealDbClient } from '../contexts/SurrealProvider';
import { useEffect, useRef } from 'react';
import type { LiveHandler, Uuid } from 'surrealdb';

export type UseLiveQueryProps<
  T extends Record<string, unknown> = Record<string, unknown>
> = {
  queryUuid: Uuid | undefined;
  callback: LiveHandler<T>;
  enabled?: boolean;
};

export const useLiveQuery = <T extends Record<string, unknown>>({
  queryUuid,
  callback,
  enabled = true,
}: UseLiveQueryProps<T>) => {
  const dbClient = useSurrealDbClient();

  // Use a ref for the callback to avoid dependency issues
  // This is a common pattern to avoid re-running effects when the callback changes
  const callbackRef = useRef(callback);

  // Update the ref when the callback changes
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);

  useEffect(() => {
    // Skip if any required value is missing
    if (!dbClient || !enabled || !queryUuid) {
      return;
    }

    let isSubscribed = true;

    const runLiveQuery = async () => {
      try {
        // Use the wrapped callback that references the current function
        await dbClient.subscribeLive<T>(queryUuid, (action, data) => {
          if (isSubscribed && action !== 'CLOSE') {
            callbackRef.current(action, data);
          }
        });
      } catch (error) {
        console.error('Failed to subscribe to live query:', error);
      }
    };

    const clearLiveQuery = async () => {
      try {
        await dbClient.kill(queryUuid);
      } catch (error) {
        console.error('Failed to kill live query:', error);
      }
    };

    // Add event listener for page unload
    const handleBeforeUnload = () => {
      clearLiveQuery();
    };

    window.addEventListener('beforeunload', handleBeforeUnload);

    // Start the subscription
    runLiveQuery();

    // Cleanup function
    return () => {
      isSubscribed = false;
      clearLiveQuery();
      window.removeEventListener('beforeunload', handleBeforeUnload);
    };
  }, [dbClient, queryUuid, enabled]);
};

export default useLiveQuery;
