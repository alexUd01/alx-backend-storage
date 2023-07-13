/* A SQL script that creates a stored procedure `ComputeAverageScoreForUser`
that computes and store the average score for a student. Note: An average
score can be a decimal

REQUIREMENTS:
- Procedure `ComputeAverageScoreForUser` is taking 1 input:
  - `user_id`, a users.id value (you can assume user_id is linked to an
    existing table `users`)
*/

-- Drop any existing stored procedure with same name
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

-- Temporarily change the delimiter
DELIMITER $$

-- Create procedure
CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
DECLARE average INT;
SELECT AVG(score) INTO average FROM corrections WHERE corrections.user_id = user_id;
UPDATE users SET average_score = average WHERE users.id = user_id;
END$$

DELIMITER ;
