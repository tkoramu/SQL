-- 3つのテーブルを内部結合する
-- SQL Server, DB2, PostgreSQL, MySQL
-- Oracleの場合はASを削除する
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    TS.shohin_id,
    S.shohin_mei,
    S.hanbai_tanka,
    ZS.zaiko_suryo
FROM TenpoShohin AS TS INNER JOIN Shohin AS S
    ON TS.shohin_id = S.shohin_id
        INNER JOIN ZaikoShohin AS ZS
            ON TS.shohin_id = ZS.shohin_id
WHERE ZS.souko_id = 'S001';

-- 内部結合を行ったFROM句に、再度INNER JOINによってZaikoShohinテーブルを追加している。
