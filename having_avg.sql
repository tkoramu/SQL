-- HAVING句あり
SELECT
    shohin_bunrui, AVG(hanbai_tanka)
FROM
    Shohin
GROUP BY
    shohin_bunrui
HAVING
    AVG(hanbai_tanka) >= 2500;

-- HAVING句なし
SELECT
    shohin_bunrui, AVG(hanbai_tanka)
FROM
    Shohin
GROUP BY
    shohin_bunrui;
