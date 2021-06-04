-- 1 Hour TWAP
with submission1 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 51, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 435, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission2 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 115, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 499, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission3 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 179, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 563, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission4 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 243, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 627, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission5 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 307, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 691, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
)


SELECT token,
    value,
    to_timestamp(time)
FROM(
  SELECT token,value,time FROM submission1
  UNION ALL
  SELECT token,value,time FROM submission2
  UNION ALL
  SELECT token,value,time FROM submission3
  UNION ALL
  SELECT token,value,time FROM submission4
  UNION ALL
  SELECT token,value,time FROM submission5
)
AS submissions
WHERE token = '46' 

-- latest
with submission1 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 51, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 435, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission2 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 115, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 499, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission3 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 179, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 563, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission4 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 243, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 627, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
),
submission5 as (
SELECT block_time,
       concat('0x', substring(encode(topic2, 'hex') from 25 for 40)) AS submission_address,
       encode(DATA, 'hex') AS DATA,
       ('x'|| substring(DATA::TEXT, 307, 16))::bit(64)::bigint as token,
       ('x'|| substring(DATA::TEXT, 691, 16))::bit(64)::bigint/1e6 as value,
       ('x'|| substring(DATA::TEXT, 371, 16))::bit(64)::bigint as time
FROM ethereum."logs" AS logs
WHERE DATA IS NOT NULL
    AND contract_address = '\x88df592f8eb5d7bd38bfef7deb0fbc02cf3778a0'
    AND topic1 = '\xbeb3b9f46c8d7bb00c873fca10d307538df350866d25f891ffb395147ddbdc45'
)


SELECT token,
    value,
    to_timestamp(time)
FROM(
  SELECT token,value,time FROM submission1
  UNION ALL
  SELECT token,value,time FROM submission2
  UNION ALL
  SELECT token,value,time FROM submission3
  UNION ALL
  SELECT token,value,time FROM submission4
  UNION ALL
  SELECT token,value,time FROM submission5
)
AS submissions
WHERE token = '1' 


