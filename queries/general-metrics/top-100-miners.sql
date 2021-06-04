-- 30 days
with miner_rewards as (
SELECT block_time,
       concat('0x', substring(encode(topic3, 'hex') from 25 for 40)) AS miner_address,
       encode(DATA, 'hex') AS DATA,
       ('x'||right(encode(data, 'hex'), 16))::bit(64)::bigint as value
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef'
    AND topic2 = '\x0000000000000000000000000000000000000000000000000000000000000000'
  AND block_time > NOW() - interval '30 days')

SELECT miner_address, sum(value/1000000000000000000) as tributes_earned
FROM miner_rewards
GROUP BY 1
ORDER BY 2 DESC

-- All time
-- Tellor Miner Transfers
with miner_rewards as (
SELECT block_time,
       concat('0x', substring(encode(topic3, 'hex') from 25 for 40)) AS miner_address,
       encode(DATA, 'hex') AS DATA,
       ('x'||right(encode(data, 'hex'), 16))::bit(64)::bigint as value
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef'
    AND topic2 = '\x0000000000000000000000000000000000000000000000000000000000000000'
)

SELECT miner_address, sum(value/1000000000000000000) as tributes_earned
FROM miner_rewards
GROUP BY 1
ORDER BY 2 DESC
LIMIT 100