select
    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) / count(*) as total_nulls

from {{ ref('my_first_dbt_model') }}

having sum(case when id is null then 1 else 0 end) / count(*) <= .4
