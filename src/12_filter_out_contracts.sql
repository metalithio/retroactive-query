SELECT * FROM `bigquery-public-data.crypto_ethereum.contracts` 
WHERE address = lower('0x8ae09173e4dff3f63d1c287d19f4a197977cb425')
LIMIT 1000

# get users by cohorts
WITH
tier_one_contributors as (
    select distinct contributor as address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.v1_contributors`
),
all_contributors as (
    select distinct fromAddress as address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.v2_mainnet_contributors`
    union distinct
    select distinct toAddress as address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.v2_mainnet_contributors`
    union distinct
    select distinct address from tier_one_contributors
),
tier_one_holders as (
    select distinct address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.tier_one_mainnet_users`
    union distinct (
        with tier_one_matic_users as (
            select address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.tier_one_matic_users` limit 1
        )
        select distinct address from tier_one_matic_users cross join unnest(tier_one_matic_users.address) as address
    )   
),
all_tier_users as (
    select distinct address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.all_tier_mainnet_users`
    union distinct (
        with all_tier_matic_users as (
            select address from `niftex-retroactive-query.retroactive_6b838dd00210ba679d4e172b01e573d784dacfac.all_tier_matic_users` limit 1
        )
        select distinct address from all_tier_matic_users cross join unnest(all_tier_matic_users.address) as address
    )
    union distinct
    select distinct address from all_contributors 
),
tier_one_users as (
    select address, cohort from (
        select address, 'tier 1' as cohort from (
            select distinct address from tier_one_contributors
            union distinct
            select distinct address from tier_one_holders
        )
    )
),
tier_three_users as (
    select distinct address, 'tier 3' as cohort from all_tier_users
    where address not in (
        select distinct address from tier_one_users
    )
)
select distinct address from tier_one_users
where address not in ( 
    SELECT address FROM `bigquery-public-data.crypto_ethereum.contracts` 
    WHERE address in ( select distinct address from tier_one_users )
)