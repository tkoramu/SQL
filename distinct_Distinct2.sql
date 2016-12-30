-- 集約関数で、値の重複を除いてくれる。
SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka)
FROM Shohin;
