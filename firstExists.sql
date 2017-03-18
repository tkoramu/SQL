-- SQL Server, DB2, PostgreSQL, MySQL
SELECT shohin_mei, hanbai_tanka
FROM    Shohin AS S
WHERE   EXISTS (
    SELECT *
    FROM    TenpoShohin AS TS
    WHERE   TS.tenpo_id = '000C'
    AND    TS.shohin_id = S.shohin_id
);

-- OracleではASは使えないので、FROM句のASを削除


-- SQL Server, DB2, PostgreSQL, MySQL
SELECT shohin_mei, hanbai_tanka
FROM    Shohin AS S
WHERE   EXISTS (
    SELECT 1    -- ここは適当な定数を書いてもかまいません
    FROM    TenpoShohin AS TS
    WHERE   TS.tenpo_id = '000C'
    AND    TS.shohin_id = S.shohin_id
);


-- NOT EXISTSで「東京店に置いてある商品"以外"の販売単価」を求める
-- SQL Server, DB2, PostgreSQL, MySQL
SELECT shohin_mei, hanbai_tanka
FROM    Shohin AS S
WHERE   NOT EXISTS (
    SELECT *
    FROM    TenpoShohin AS TS
    WHERE   TS.tenpo_id = '000A'
    AND     TS.shohin_id = S.shohin_id
);
