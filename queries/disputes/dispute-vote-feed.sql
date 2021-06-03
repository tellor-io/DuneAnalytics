SELECT block_time,
    concat('0x', substring(encode(topic3, 'hex') from 25 for 40)) AS voter_address,
    ('x'||right(encode(topic2, 'hex'), 16))::bit(64)::bigint as dispute_id,
    ('x'||right(encode(data, 'hex'), 16))::bit(64)::bigint as support_1_challenge_0
FROM ethereum."logs" AS logs
WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\x911ef2e98570b1d96c0e8ef81107a33d5b8e844aeb8f9710f9bc76c3b3fef40e'
ORDER BY 1 DESC