SELECT
    test_group,
    COUNT(*) AS users_cnt,
    SUM(converted) AS converted_users,
    ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate_pct,
    ROUND(AVG(revenue), 2) AS arpu,
    ROUND(AVG(CASE WHEN converted = 1 THEN revenue END), 2) AS avg_check,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;