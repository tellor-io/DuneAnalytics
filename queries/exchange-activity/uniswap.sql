WITH withdraws as (
Select date_trunc('day',evt_block_time) as day,
    SUM(CAST(swap."amount0" as NUMERIC)/1e18) as swaps 
FROM uniswap_v3."Pair_evt_Swap" as swap
WHERE contract_address = '\xd8c81e66a71fcfe8258b0cf84267275cdc91cac3'
AND amount0 < 0
GROUP BY 1
ORDER BY 1 DESC
),
deposits as (
Select date_trunc('day',evt_block_time) as day,
    SUM(CAST(swap."amount0" as NUMERIC)/1e18) as swaps 
FROM uniswap_v3."Pair_evt_Swap" as swap
WHERE contract_address = '\xd8c81e66a71fcfe8258b0cf84267275cdc91cac3'
AND amount0 > 0
GROUP BY 1
ORDER BY 1 DESC
),
days AS (
    SELECT DISTINCT date_trunc('day', time) as day
    FROM ethereum.blocks
    WHERE time > '2021-05-06'
)


SELECT days.day AS DAY,
    withdraws.swaps as withdraws,
    deposits.swaps as deposits
FROM days
FULL JOIN withdraws ON days.day = withdraws.day
FULL JOIN deposits ON days.day = deposits.day