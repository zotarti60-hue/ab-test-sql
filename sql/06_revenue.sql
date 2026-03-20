SELECT
    test_group,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;