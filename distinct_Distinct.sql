-- 同じ値が複数行に含まれている場合は、DISTINCT(意味：異なります)を使用すると値の重複を除いてくれる。
SELECT COUNT(DISTINCT shohin_bunrui)
FROM Shohin;
