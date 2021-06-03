l-- -- Tellor Miner Transfers
with tellor_difficulties as (
    SELECT block_time,
           data,
          ('x'||SUBSTRING(ENCODE(data, 'hex') from 368 for 16))::bit(64)::bigint as difficulty --('x'||right(encode(SUBSTRING(data from 65 for 64), 'hex'), 64)) as difficulty
    FROM ethereum."logs" AS logs
    WHERE DATA IS NOT NULL
      AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
      AND topic1 = '\x1d85ce10456e29b67de37887496d3f1fcf1b64c79c4d07484038703a9f5c1408'
      --AND block_time > NOW() - INTERVAL '180 days'
)
  
SELECT date_trunc('day', block_time) as day, avg(difficulty) as average_daily_difficulty 
from tellor_difficulties
group by 1
order by 1 DESC
  