-- SQL Advent Calendar - Day 6
-- Title: Ski Resort Snowfall Rankings
-- Difficulty: hard
--
-- Question:
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--

-- Table Schema:
-- Table: resort_monthly_snowfall
--   resort_id: INT
--   resort_name: VARCHAR
--   snow_month: INT
--   snowfall_inches: DECIMAL
--

-- My Solution:

with t1 as (
            select resort_id, resort_name, sum(snowfall_inches) annual_snowfall_inches
            from resort_monthly_snowfall
            group by resort_id, resort_name
            --order by resort_id
            )
select *,
        ntile(4) over(order by annual_snowfall_inches desc) as snowfall_quartile
from t1
order by snowfall_quartile
