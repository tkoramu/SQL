-- HAVING句あり
SELECT
    shohin_bunrui, COUNT(*)
FROM
    Shohin
GROUP BY
    shohin_bunrui
HAVING
    COUNT(*) = 2;

-- HAVING句なし
SELECT
    shohin_bunrui, COUNT(*)
FROM
    Shohin
GROUP BY
    shohin_bunrui;
