SELECT
    test_group,
    COUNT(*) AS users_cnt,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS share_pct
FROM portfolio.ab_test_orders
GROUP BY test_group
ORDER BY test_group;