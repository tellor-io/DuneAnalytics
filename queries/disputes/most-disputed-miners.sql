with disputes as (SELECT block_time,
    ( 'x' || substring(encode(topic3, 'hex'), 49, 16))::bit(64)::bigint AS disputed_feed_id,
    concat('0x', substring(encode(DATA, 'hex') from 89 for 40)) AS disputed_miner_address
FROM ethereum."logs" AS logs
WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xeceec1aebf67772b2440120c4b4dc913a1fe1b865509219f9456785c23b9da64'
ORDER BY 1 DESC)

SELECT disputed_miner_address, count(*) as dispute_count
FROM disputes
GROUP BY disputed_miner_address
ORDER BY dispute_count DESC