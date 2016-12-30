-- COUNT関数は引数にとる列によって動作が変わる、
-- NULLが含まれていれば、*と違いNULLを除外する。
SELECT COUNT(shiire_tanka)
FROM Shohin;
