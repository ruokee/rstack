# Change locality

Keep changes to a decision with its owner. Give callers and readers the contracts they need for their own tasks. The investigation can extend beyond the edit. A search match is a place to inspect.

## Set the edit boundary

At each location, ask what call, check, or reader task would fail if it stayed as it is. Follow real references until the effect stops. Keep explanations that remain accurate and sufficient. Use comments for constraints or reasons the code cannot readily express. Leave internal naming changes out of user-facing material.

For a private function rename, update its declaration and actual references, including code that looks it up by name and maintenance instructions that require the name. Leave docs alone when their outputs, usage, and links still hold. For a public CLI flag rename, update commands readers will copy and handle the old flag according to the existing compatibility requirements.

## Walk through the next change

Try a change supported by a requirement or recent history. Identify who owns the decision and what would need manual synchronization. Put rules that change together under the same owner and expose a stable operation or description to consumers. Keep the direct implementation when no particular direction of change is established.

Higher-level material should change less often than the details it describes. Keep overviews and entry points focused on stable responsibilities, contracts, and reader paths. Update them when those change.

Consider adding an export format. The overview describes what exporting does. Leave out a full list or count unless readers need it there. Maintain the full list in command help or a dedicated reference where readers choose a format. A tutorial keeps the actual command that completes its task. Each format's implementation owns its distinct behavior. A closed set of formats that forms part of a public contract still needs to be explicit.

## Reclaim scattered knowledge

Start from a real recent change or a suspected duplicate in existing material, such as a list, count, or set of links. Find the source and separate real dependencies from copies of the same fact. Preserve independent contracts, behavioral checks, and context readers need. Maintain each rule or list at its authoritative location. Elsewhere, remove redundant copies, link to the source when readers need the detail, or generate a copy when a separate artifact is required.

A repeated link can serve readers who start on different pages. Keep links that serve those reading paths. Remove a link when it adds no useful route for that page's readers. An overview can link to a stable index without repeating the index's links.

Walk through the same kind of change again. Confirm that operations, reading tasks, and compatibility checks still work without another round of manual edits to redundant copies. Treat cleanup outside the current change as a separate revision.
