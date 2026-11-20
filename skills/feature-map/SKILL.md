---
name: feature-map
description: Use when creating or updating a project feature map that connects user-visible behavior to implementation entry points.
disable-model-invocation: true
metadata:
  version: "1.0.0"
---

# Map project features

Deliver a navigable index. Its unit is a user action and a reading address. A developer should be able to scan the feature names, choose one and go straight to code. A one-off lookup ends with the answer; a planning request can use the project's existing index directly.

## Set the scope

Identify the version, requested area, documentation language requirements and the index people already open. Reuse that index if it can carry the missing pointers. For project-wide coverage, enumerate the public entry points from the actual registrations and user guide. For partial coverage, name the included area and consequential gaps.

## Trace user actions

Group public entry points by the user's intended result. Before listing two as alternatives, compare the required input, the objects affected and the state left afterward. Put them on the same action only when either one actually delivers what the heading promises. Give different actions their own bullets even when they share an implementation. A feature-area heading can group related bullets without making their entrances interchangeable.

Use terms from real requests, commands, routes, menus or public APIs. Follow each entrance through dispatch to the symbol that decides the action. Check what the caller passes to a shared handler. Link the shared rule once where helpful. If a guide disagrees with the live branch, identify the discrepancy and link the deciding source.

## Write the index

Write the smallest complete index first. Each entry is one short bullet: **user action**, public entrance, linked symbol and what to look for there. Add a second pointer only when it changes the reader's choice. Group bullets under plain feature-area headings. For a large area, split its bullets onto a linked page. Use file links relative to the document.

A map entry for an existing product looks like this:

- **Understand an empty trace search.** For `langwatch trace search`, see [the CLI's `emptySearchHint`](https://github.com/langwatch/langwatch/blob/ea636c6f90a5934a6913d61d6408c092ac9359bd/sdks/typescript/src/cli/commands/traces/search.ts). For `search_traces`, see [the MCP tool's `buildEmptyResult`](https://github.com/langwatch/langwatch/blob/ea636c6f90a5934a6913d61d6408c092ac9359bd/mcp/typescript/src/tools/search-traces.ts).

Stop each entry at that level. For modes or stages with different effects, point to where each effect is decided. Leave error catalogs, parameter semantics, guarantees and sequences in their authoritative reference; link it if needed. When an access condition changes which entry is available, state its narrow scope from the deciding branch. Mark a runtime-dependent conclusion as such.

Finish the map in the project's required languages and add one short discovery link to the usual navigation for each. Check the index before considering more prose. Expand only an entry that fails a real lookup.

## Update an existing map

First establish the change. Within the assigned project, compare the affected map entries with the current public interface and the code that implements it. Use the version diff or release note when available. Without history, use the current command or route declaration and its reference to find the specific missing or stale capability in the old entry. Distinguish that mismatch from rules that merely describe the same subject.

For each affected user action, identify the old reading path, the current public choice and the symbol that now decides it. Check every entrance that exposes a shared change, including interactions with existing choices when one takes precedence. Update the shared entry once and keep the other entrances discoverable. A new name, moved implementation or removed entrance needs only the corresponding navigation change. Proposed features stay in the plan.

Make the smallest edit that lets a reader find the changed behavior. Leave neighboring mechanics in their existing reference. Compare the updated entry with the original: each added claim must explain this change and match its deciding branch. Remove an incidental explanation rather than generalizing it across input forms. Mirror the same edit in the required languages. Finish by walking the affected entrances from the navigation and checking that the retained paths still work.

## Check the reading path

Compare the finished index to the public entry inventory. Start at the project navigation, pick a representative request in the user's words and open the linked definition. Does it decide the question or lead immediately to the owner? Could the nearest alternative take a different path? Fix a misleading pointer. Replace incidental behavioral claims with links to the deciding sources. When all in-scope groups have usable paths, deliver the map, its coverage and any remaining gaps.
