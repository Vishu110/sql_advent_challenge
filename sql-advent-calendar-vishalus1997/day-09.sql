-- SQL Advent Calendar - Day 9
-- Title: Tinsel and Light Combinations
-- Difficulty: hard
--
-- Question:
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").
--
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-"). 
--

-- Table Schema:
-- Table: tinsel_colors
--   tinsel_id: INT
--   color_name: VARCHAR
--
-- Table: light_colors
--   light_id: INT
--   color_name: VARCHAR
--

-- My Solution:

select tc.color_name tinsel_colors, lc.color_name light_colors, tc.color_name || '-' || lc.color_name tinsel_light
from tinsel_colors tc
cross join light_colors lc
--on tc.tinsel_id = lc.light_id
