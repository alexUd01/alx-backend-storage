/* A SQL script that creates a function `SafeDiv` that divides (and
returns) the first by the second number or returns 0 if the second
number is equal to 0.

REQUIREMENTS:
- You must create a function
- The function SafeDiv takes 2 arguments:
  - a, INT
  - b, INT
- And returns a / b or 0 if b == 0
*/

-- Drop pre-existing function if it exists
DROP FUNCTION IF EXISTS SafeDiv;

-- Create new function
CREATE FUNCTION SafeDIV ()
BEGIN
END
