/* A SQL script that creates a stored `procedure` AddBonus that adds a new
correction for a student.

REQUIREMENTS:
- Procedure `AddBonus` is taking 3 inputs (in this order):
  - `user_id`, a users.id value (you can assume `user_id` is linked to an
    existing users table)
  - `project_name`, a new or already exists projects - if no `projects.name`
    found in the table, you should create it
  - score, the score value for the correction

Context: Write code in SQL is a nice level up!
*/

-- Drop any existing stored procedure with same name
DROP PROCEDURE IF EXISTS reset_valid_email;

-- Temporary change the delimiter from `;` to `$$`
DELIMITER $$

--
