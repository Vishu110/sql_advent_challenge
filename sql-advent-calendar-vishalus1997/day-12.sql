-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

with t1 as (
            select user_id, user_name, date(sent_at) sent_att, count(*) msg_count,
                    rank() over(partition by date(sent_at) order by count(*) desc) r
            from npn_users nu
            join npn_messages nm
            on nu.user_id = nm.sender_id
            group by user_id, user_name, date(sent_at)
            order by sent_att
            )
select *
from t1
where r = 1
