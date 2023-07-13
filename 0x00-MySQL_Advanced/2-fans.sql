/* A SQL script that ranks country origins of bands, ordered by the number
of (non-unique) fans

REQUIREMENTS:
- Import this table dump: `metal_bands.sql.zip`
- Column names must be: origin and nb_fans
- Your script can be executed on any database
*/

-- The query
SELECT origin, fans AS nb_fans FROM metal_bands ORDER BY nb_fans DESC;
