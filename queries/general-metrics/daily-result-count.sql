with submission_results as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'||right(encode(data, 'hex'), 16))::bit(64)::bigint as value
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
-- Tellor Daily Active Miners
daily_submissions as (
SELECT date_trunc('day', block_time) as day, count(distinct submission_address) as submissions
FROM submission_results
GROUP BY 1
ORDER BY 1 DESC)

select daily_submissions.day, 
       daily_submissions.submissions as daily_submissions
from daily_submissions
ORDER BY 1 DESC
