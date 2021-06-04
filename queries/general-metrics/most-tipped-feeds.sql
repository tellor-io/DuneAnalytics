-- 30 days
with tipped_feeds as (SELECT block_time,
    ( 'x' || right(encode(topic3, 'hex'), 16))::bit(64)::bigint AS tipped_feed_id,
    ('x' || right(encode(DATA, 'hex'), 16))::bit(64)::bigint/1e18 AS tip_size
FROM ethereum."logs" AS logs
WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xd32134405b68f6f7220f9c38ae310df1b648d16188006768d45be2f7c24e8820'
    AND block_time > NOW() - interval '30 days'
ORDER BY 1 DESC)

SELECT tipped_feed_id, sum(tip_size) as total_tips_submitted
FROM tipped_feeds
GROUP BY 1
ORDER BY 2 DESC

-- All time
with tipped_feeds as (SELECT block_time,
    ( 'x' || right(encode(topic3, 'hex'), 16))::bit(64)::bigint AS tipped_feed_id,
    ('x' || right(encode(DATA, 'hex'), 16))::bit(64)::bigint/1e18 AS tip_size
FROM ethereum."logs" AS logs
WHERE contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xd32134405b68f6f7220f9c38ae310df1b648d16188006768d45be2f7c24e8820'
ORDER BY 1 DESC)

SELECT tipped_feed_id, sum(tip_size) as total_tips_submitted
FROM tipped_feeds
GROUP BY 1
ORDER BY 2 DESC