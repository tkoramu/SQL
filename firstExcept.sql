-- SQL Server, DB2, PostgreSQL
-- MySQLにはまだない機能
SELECT shohin_id, shohin_mei
FROM Shohin
EXCEPT
SELECT shohin_id, shohin_mei
FROM Shohin2
ORDER BY shohin_id;

-- Oracleでは、MINUSに変更
SELECT shohin_id, shohin_mei
FROM Shohin
MINUS
SELECT shohin_id, shohin_mei
FROM Shohin2
ORDER BY shohin_id;
