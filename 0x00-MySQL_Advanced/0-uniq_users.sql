/* A SQL script that creates a table `users` following these requirements:
- Attributes:
  - id, integer, never null,auto increment and primary key
  - email, string(255 characters), never null and unique
  - name, string(255 characters)
- If the table already exists, your script should not fail
- Your scriipt can be executed on any database
Context: Making attribute unique directly in the table schema will enforce
your business rukes and avoid bugs in your application
*/

-- Create a table `users`
CREATE TABLE IF NOT EXISTS `users` (
       `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       `email` VARCHAR(255) NOT NULL UNIQUE,
       `name` VARCHAR(255)
);
