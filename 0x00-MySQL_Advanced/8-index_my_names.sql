/* A SQL script that creates an index `idx_name_first` on the table `names`
and the first letter of `name`.

REQUIREMENTS:
- Import this table dump: names.sql.zip
- Only the first letter of name must be indexed

Context: Index is not the solution for any performance issue, but well
used, it’s really powerful!
*/

-- Drop any existing stored procedure with same name
DROP INDEX IF EXISTS idx_name_first;

-- THE COMMAND
CREATE INDEX idx_name_first
ON names (name(1));
