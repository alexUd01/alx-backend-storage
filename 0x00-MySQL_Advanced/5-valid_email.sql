/* A SQL script that creates a trigger that resets the attribute `valid_email`
only when the `email` has been changed.

Context: Nothing related to MySQL, but perfect for user email
validation - distribute the logic to the database itself!
*/

-- Drop any existing trigger with same name
DROP TRIGGER IF EXISTS reset_valid_email;

-- Temporary change the delimiter from `;` to `$$`
DELIMITER $$

-- Create trigger
CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON `users`
FOR EACH ROW
BEGIN
IF (NEW.email != OLD.email)
THEN
   SET NEW.valid_email = 0;
END IF;
END$$
DELIMITER ;$$
