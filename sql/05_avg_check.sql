SELECT
    test_group,
    ROUND(AVG(revenue), 2) AS avg_check
FROM portfolio.ab_test_orders
WHERE converted = 1
GROUP BY test_group
ORDER BY test_group;