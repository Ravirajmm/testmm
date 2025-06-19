SELECT
    c.customer_id,
    c.email,
    p.policy_id,
    p.policy_type,
    p.premium_amount,
    cl.claim_id,
    cl.claim_status,
    cl.claim_date,
    cl.claim_amount
FROM {{ ref('claims') }} cl
JOIN {{ ref('policies') }} p
  ON cl.policy_id = p.policy_id
JOIN {{ ref('customers') }} c
  ON p.customer_id = c.customer_id