/*
 * # Note Inbox
 *
 * Have a dashboard, or view, of multiple notes created that
 * acomplish a filter
 *
 * frontmatter to add to Obsidian:
 *
 *
 * Uses dataview syntax
 *
 */

List
From ""
WHERE (
	(length(file.inlinks) > 0 AND !any(filter(file.inlinks, (x) => contains(x.tags, "type/"))) AND length(file.tags) = 0)
	OR
	(length(file.inlinks) = 0 AND length(file.tags) = 0))
AND !contains(file.tags, "journal")
AND !contains(file.folder, "template")
SORT file.mtime desc

