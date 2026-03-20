WITH stats AS (
    SELECT
        test_group,
        COUNT(*) AS users,
        SUM(converted) AS conversions
    FROM portfolio.ab_test_orders
    GROUP BY test_group
),

pivot AS (
    SELECT
        MAX(CASE WHEN test_group = 'A' THEN users END) AS n1,
        MAX(CASE WHEN test_group = 'A' THEN conversions END) AS x1,
        MAX(CASE WHEN test_group = 'B' THEN users END) AS n2,
        MAX(CASE WHEN test_group = 'B' THEN conversions END) AS x2
    FROM stats
),

calc AS (
    SELECT
        n1, x1, n2, x2,
        x1::float / n1 AS p1,
        x2::float / n2 AS p2,
        (x1 + x2)::float / (n1 + n2) AS p_pool
    FROM pivot
)

SELECT
    *,
    (p1 - p2) /
    SQRT(p_pool * (1 - p_pool) * (1.0/n1 + 1.0/n2)) AS z_score
FROM calc;