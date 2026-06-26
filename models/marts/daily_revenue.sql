{{ config(
        materialized='table',
        schema='marts',
        database='analytics'
) }}

SELECT
    transaction_date,
    sum(amount) AS total_revenue,
    count(distinct customer_id) AS unique_customers
FROM {{ ref('stg_transactions') }}
GROUP BY transaction_date