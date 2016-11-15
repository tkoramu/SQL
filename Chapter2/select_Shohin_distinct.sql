-- 重複しているものを省きます。
SELECT DISTINCT shohin_bunrui
FROM Shohin;

SELECT DISTINCT shiire_tanka
FROM Shohin;

SELECT DISTINCT
    shohin_bunrui,
    torokubi
FROM Shohin;
