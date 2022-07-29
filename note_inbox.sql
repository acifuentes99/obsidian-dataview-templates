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
 * ---
 * tags: type/inbox
 * last-days: 200 days
 * number-results: 50
 * ---
 * Link para last-days: https://blacksmithgu.github.io/obsidian-dataview/query/literals/
 */

```dataview
TABLE file.cday, file.mday
From ""
WHERE (
	(length(file.inlinks) > 0 AND !any(filter(file.inlinks, (x) => contains(x.tags, "type/"))) AND length(file.tags) = 0)
	OR
	(length(file.inlinks) = 0 AND length(file.tags) = 0))
AND !contains(file.tags, "journal")
AND !contains(file.folder, "template")
AND file.ctime > (date(today) - dur(this.file.frontmatter.last-days))
SORT file.mtime desc
LIMIT this.file.frontmatter.number-results
```
