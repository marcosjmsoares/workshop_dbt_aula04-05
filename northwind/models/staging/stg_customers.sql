-- models/staging/stg_customers.sql

-- IMPORTS

WITH SOURCES AS (
    SELECT * FROM {{ ref('raw_customers') }}
),

--LOGICA DE NEGOCIO

RENAMED_AND_CLEANING AS (
select
    customer_id,
    company_name,
    contact_name,
    contact_title,
    address,
    city,
    region,
    postal_code,
    country,
    phone,
    fax
from
    SOURCES
)

--QUERY FINAL

SELECT * FROM RENAMED_AND_CLEANING