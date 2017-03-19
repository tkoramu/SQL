-- INTERSECTによるテーブル共通部分の選択
-- Oracle, SQL Server, DB2, PostgreSQL
-- MySQLにはまだない機能
SELECT shohin_id, shohin_mei
FROM Shohin
INTERSECT
SELECT shohin_id, shohin_mei
FROM Shohin2
ORDER BY shohin_id;
