-- {{ config(materialized='table') }}

-- with complete_data as (
--     select * from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER"
-- )

-- select * 
-- from complete_data


-- select count(*)
-- from "ANALYTICS"."DBT"."PLAYING_WITH_TESTS" 

-- where C_MKTSEGMENT not in ('BUILDING','AUTOMOBILE','MACHINERY','HOUSEHOLD','FURNITURE')

-- having count(*)>1

-- select count(*) as total_count, 
-- sum(C_ACCTBAL) as total_balance 
-- from "ANALYTICS"."DBT"."PLAYING_WITH_TESTS" 

-- having sum(C_ACCTBAL)>100000000


with sample_customer as (
  SELECT *
  FROM {{ source('sample2', 'customer') }}
)

select
  c_custkey,
  c_mktsegment,
  {{rename_segments('c_mktsegment')}} mkt_segment_adjusted,
  c_acctbal
from sample_customer