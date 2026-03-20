SELECT
    test_group,
    ROUND(AVG(revenue), 2) AS arpu
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;