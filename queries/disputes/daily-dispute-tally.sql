with new_dispute_events as (
SELECT block_time
FROM ethereum."logs" AS logs
WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xeceec1aebf67772b2440120c4b4dc913a1fe1b865509219f9456785c23b9da64'
),
-- Tellor Daily Disputes
daily_disputes as (
SELECT date_trunc('day', block_time) as day, count(distinct block_time) as daily_dispute_events
FROM new_dispute_events
GROUP BY 1
ORDER BY 1 DESC)

select daily_disputes.day, daily_disputes.daily_dispute_events
from daily_disputes
ORDER BY 1 DESC