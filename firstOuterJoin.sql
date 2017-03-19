-- SQL Server, DB2, PostgreSQL, MySQL
-- Oracleの場合はASを削除する
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    S.shohin_id,
    S.shohin_mei,
    S.hanbai_tanka
FROM TenpoShohin AS TS RIGHT OUTER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;

/*
- 外部結合のポイント
1. 片方のテーブルの情報が全て出力される
2. どちらのテーブルをマスタにするか
 */

 SELECT
     TS.tenpo_id,
     TS.tenpo_mei,
     S.shohin_id,
     S.shohin_mei,
     S.hanbai_tanka
 FROM Shohin AS S LEFT OUTER JOIN TenpoShohin AS TS
 ON TS.shohin_id = S.shohin_id;
