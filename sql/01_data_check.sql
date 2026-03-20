SELECT
    test_group,
    COUNT(*) AS users_cnt
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;