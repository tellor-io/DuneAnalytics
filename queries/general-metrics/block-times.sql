-- -- Tellor Miner Transfers
with tellor_submits as (
    SELECT logs.block_time, 
           encode(topic3, 'hex') as challenge
    FROM ethereum."logs" AS logs
    WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
      AND topic1 = '\x9d2e5f03fc65aff196e0f3a8dd924b24099de487e8cffc888921d420ab196e39'
      --AND block_time > NOW() - INTERVAL '180 days'
), 
tellor_submits_last_times as (
    SELECT block_time,
           challenge,
           LAG(block_time,1) OVER (
               PARTITION BY challenge
               ORDER BY block_time DESC
           ) last_block_time
    FROM tellor_submits
),
challenge_times as (
SELECT challenge, min(block_time) as block_started_at, EXTRACT('epoch' FROM SUM(last_block_time - block_time)) as block_time 
from tellor_submits_last_times
GROUP BY 1)

select DATE_TRUNC('hour', block_started_at) as "date", 300 as target_time, AVG(block_time) as block_time
FROM challenge_times
GROUP BY 1, 2
  