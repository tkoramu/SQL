SELECT
    shohin_id
    ,shohin_mei
    ,hanbai_tanka
    ,shiire_tanka
FROM
    Shohin;

-- ORDER BY を付けた場合
SELECT
    shohin_id
    ,shohin_mei
    ,hanbai_tanka
    ,shiire_tanka
FROM
    Shohin
ORDER BY
    hanbai_tanka;
