SELECT
    test_group,
    COUNT(*) AS users_cnt,
    SUM(converted) AS converted_users,
    ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;