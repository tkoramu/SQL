-- スカラ・サブクエリを書ける場所
SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    (SELECT AVG(hanbai_tanka) FROM Shohin) AS avg_tanka
FROM
    Shohin;


SELECT
    shohin_bunrui,
    AVG(hanbai_tanka)
FROM
    Shohin
GROUP BY shohin_bunrui
HAVING
    AVG(hanbai_tanka) > (SELECT AVG(hanbai_tanka) FROM Shohin);
