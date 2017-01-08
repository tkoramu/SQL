-- 複数のソートキーを指定
SELECT
    shohin_id
    ,shohin_mei
    ,hanbai_tanka
    ,shiire_tanka
FROM
    Shohin
ORDER BY hanbai_tanka, shohin_id;
