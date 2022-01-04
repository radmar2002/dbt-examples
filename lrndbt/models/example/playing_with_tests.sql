{{ config(materialized='table') }}

with complete_data as (
    select * from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."CUSTOMER"
)

select * 
from complete_data


select count(*)
from "ANALYTICS"."DBT"."PLAYING_WITH_TESTS" 

where C_MKTSEGMENT not in ('BUILDING','AUTOMOBILE','MACHINERY','HOUSEHOLD','FURNITURE')

having count(*)>1

select count(*) as total_count, 
sum(C_ACCTBAL) as total_balance 
from "ANALYTICS"."DBT"."PLAYING_WITH_TESTS" 

having sum(C_ACCTBAL)>100000000