-- SELECT句に含まれていなくてもテーブルに存在すればORDER BYに指定できる
SELECT
    shohin_mei
    ,hanbai_tanka
    ,shiire_tanka
FROM
    Shohin
ORDER BY shohin_id;
