# Bug Tracker DB

MySQL database schema for a bug tracking system. School project.

## Tables

- `account` - users with role and type, stores name, email, password hash, hourly rate
- `account_role` - user roles (e.g. developer, tester, admin)
- `account_type` - user types
- `bug` - bug reports with summary, description, resolution, hours spent, date reported
- `bugseverity` - severity levels
- `bugpriority` - priority levels
- `bug_status` - status tracking (open, in progress, closed, etc.)
- `bug_historie` - change history log with who changed what and when
- `bug_tag` - many-to-many between bugs and tags
- `bug_produkt` - many-to-many between bugs and products
- `comment` - comments on bugs with author and date
- `comment_has_comment` - nested comment tree (closure table with ancestor/descendant/depth)
- `screenshot` - bug screenshots stored as BLOBs
- `produkt` - products that bugs belong to
- `product_account` - which users work on which products
- `tag` - labels for categorizing bugs

## Files

- `schema/DB.sql` - full CREATE TABLE statements (MySQL InnoDB)
- `diagrams/` - ER diagrams as UMlet `.uxf` source files and exported `.jpg`
