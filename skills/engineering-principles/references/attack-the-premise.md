# Attack the premise

Repeated repairs can change details while preserving the assumption causing the failure. Compare what the unsuccessful attempts took for granted before choosing another repair.

Suppose a report displays the previous day's totals. Increasing cache refresh frequency and shortening cache lifetime both assume the cache is serving old data. Compare the authoritative query result, cache entry, and displayed date for the same request and timezone. If the query already returns the previous day, investigate date selection before another cache change. If the query and cache differ, their update path remains a relevant explanation.

Express the disputed premise as a concrete claim, separate from the required behavior and observed facts. Choose an observation with possible outcomes that distinguish it from a competing explanation. Interpret the result within the sampled conditions; an observation at one time can leave an intermittent mechanism unresolved.

Use existing evidence where it answers the question. Repeated failure is a reason to reassess, with no universal attempt count. Select the repair from the mechanism established by the observations.

[Fix root causes](./fix-root-causes.md) develops the causal investigation. [Redesign from first principles](./redesign-from-first-principles.md) starts from an established requirement whose implications need a design decision.
