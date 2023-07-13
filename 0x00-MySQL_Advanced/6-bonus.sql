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
DROP PROCEDURE IF EXISTS AddBonus;

-- Temporary change the delimiter from `;` to `$$`
DELIMITER $$

--
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score INT)
BEGIN
-- Check if project.name exists
DECLARE proj_id INT;
SELECT id INTO proj_id from projects WHERE name=project_name;
IF (proj_id = '' || proj_id IS NULL) THEN
   INSERT INTO projects (name) VALUE (project_name);
   SELECT id INTO proj_id from projects WHERE name=project_name;
END IF;

-- Add a new row to correction table
INSERT INTO corrections (user_id, project_id, score)
VALUES (user_id, proj_id, score);
END$$

DELIMITER ;
