/* a SQL script that creates a stored
procedure `ComputeAverageWeightedScoreForUser` that computes and store
the average weighted score for a student.

REQUIREMENTS:
- Procedure `ComputeAverageScoreForUser` is taking 1 input:
  - `user_id`, a users.id value (you can assume user_id is linked to an
    existing users)

Tips:
Calculate-Weighted-Average - https://www.wikihow.com/Calculate-Weighted-Average
*/

-- Drop existing procedure
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

-- Custom delimiter
DELIMITER $$

-- Create new procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    user_id INT
)
BEGIN
    DECLARE w_avg_score FLOAT;
    SET w_avg_score = (SELECT SUM(score * weight) / SUM(weight)
                        FROM users AS U
                        JOIN corrections as C ON U.id=C.user_id
                        JOIN projects AS P ON C.project_id=P.id
                        WHERE U.id=user_id);
    UPDATE users SET average_score = w_avg_score WHERE id=user_id;
END$$

-- Reset delimiter to default
DELIMITER ;
