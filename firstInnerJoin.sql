-- ShohinとTenpoShoinを内部結合する
-- SQL Server, DB2, PostgreSQL, MySQL
-- Oracleの場合はASを削除
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    TS.shohin_id,
    S.shohin_mei,
    S.hanbai_tanka
FROM TenpoShohin AS TS INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id;

/*
- 内部結合のポイント
1. FROM句
    - INNER JOINを使用し、テーブルを複数書いている
2. ON句
    - 結合条件専用のWHERE句のような役割
    - 内部結合を行う場合は必須
    - 書く場所はFROMとWHEREの間でなくてはならない
3. SELECT句
    - <テーブルの別名>.<列名>という記述をする
 */


-- 内部結合とWHERE句を組み合わせる
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    TS.shohin_id,
    S.shohin_mei,
    S.hanbai_tanka
FROM TenpoShohin AS TS INNER JOIN Shohin AS S
ON TS.shohin_id = S.shohin_id
WHERE TS.tenpo_id = '000A';
