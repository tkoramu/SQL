-- スカラ・サブクエリではないのでSELECT句にかけない
SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    (SELECT AVG(hanbai_tanka)
        FROM Shohin
        GROUP BY shohin_bunrui) AS avg_tanka
FROM Shohin;
