/* A SQL script that creates a stored
procedure `ComputeAverageWeightedScoreForUsers` that computes and store the
average weighted score for all students.

REQUIREMENTS:
- Procedure `ComputeAverageWeightedScoreForUsers` is not taking any input.

Tips:
Calculate-Weighted-Average
*/

-- Drop existing procedure
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

-- Custom delimiter
DELIMITER $$

-- Create new procedure
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users AS U,
        (SELECT U.id, SUM(score * weight) / SUM(weight) AS w_avg
        FROM users AS U
        JOIN corrections as C ON U.id=C.user_id
        JOIN projects AS P ON C.project_id=P.id
        GROUP BY U.id)
    AS WA
    SET U.average_score = WA.w_avg
    WHERE U.id=WA.id;
END$$

-- Reset delimiter to default
DELIMITER ;
