-- CASE式で商品分類にA~Cの文字列を割り当てる
SELECT shohin_mei,
    CASE WHEN shohin_bunrui = '衣服'
         THEN 'A:' || shohin_bunrui
         WHEN shohin_bunrui = '事務用品'
         THEN 'B:' || shohin_bunrui
         WHEN shohin_bunrui = 'キッチン用品'
         THEN 'C:' || shohin_bunrui
         ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;

-- MySQL
SELECT shohin_mei,
    CASE WHEN shohin_bunrui = '衣服'
         THEN CONCAT('A:',shohin_bunrui)
         WHEN shohin_bunrui = '事務用品'
         THEN CONCAT('B:',shohin_bunrui)
         WHEN shohin_bunrui = 'キッチン用品'
         THEN CONCAT('C:',shohin_bunrui)
         ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;


-- 普通にGROUP BYを使っても行列変換はできない
SELECT shohin_bunrui,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui;

-- 商品分類ごとに販売単価を合計した結果を行列変換する
SELECT SUM(CASE WHEN shohin_bunrui = '衣服'
            THEN hanbai_tanka ELSE 0 END) as sum_tanka_ihuku,
        SUM(CASE WHEN shohin_bunrui = 'キッチン用品'
                    THEN hanbai_tanka ELSE 0 END) as sum_tanka_kitchen,
        SUM(CASE WHEN shohin_bunrui = '事務用品'
                    THEN hanbai_tanka ELSE 0 END) as sum_tanka_jimu
FROM Shohin;


-- 単純CASE式
CASE 式
    WHEN 式 THEN 式
    WHEN 式 THEN 式
    WHEN 式 THEN 式
    ︙
    ELSE 式
END

-- 検索CASE式で単純CASE式で同じ意味のSQL文を書いてみる
-- 検索CASE式で書いた場合
SELECT shohin_mei,
    CASE WHEN shohin_bunrui = '衣服'
         THEN 'A:' || shohin_bunrui
         WHEN shohin_bunrui = '事務用品'
         THEN 'B:' || shohin_bunrui
         WHEN shohin_bunrui = 'キッチン用品'
         THEN 'C:' || shohin_bunrui
         ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;

-- 単純CASE式で書いた場合
SELECT shohin_mei,
    CASE shohin_bunrui
         WHEN '衣服'          THEN 'A:' || shohin_bunrui
         WHEN '事務用品'      THEN 'B:' || shohin_bunrui
         WHEN 'キッチン用品'  THEN 'C:' || shohin_bunrui
         ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;

-- OracleのDECODEでCASE式を代用
SELECT shohin_mei,
    DECODE(shohin_bunrui,
        '衣服',         'A:' || shohin_bunrui,
        '事務用品',     'B:' || shohin_bunrui,
        'キッチン用品', 'C:' || shohin_bunrui,
         ELSE NULL
    END AS abc_shohin_bunrui
FROM Shohin;

-- MySQLのIFでCASE式を代用
SELECT shohin_mei,
    IF(
        IF(
            IF(
                shohin_bunrui = '衣服',
                CONCAT('A:', shohin_bunrui), NULL
            )
            IS NULL AND shohin_bunrui = '事務用品',
                CONCAT('B:', shohin_bunrui),
            IF(
                shohin_bunrui = '衣服',
                CONCAT('A:', shohin_bunrui), NULL
            )
        )
        IS NULL AND shohin_bunrui = 'キッチン用品',
            CONCAT('C:', shohin_bunrui),
        IF(
            IF(
                shohin_bunrui = '衣服',
                CONCAT('A:', shohin_bunrui), NULL
            )
            IS NULL AND shohin_bunrui = '事務用品',
                CONCAT('B:', shohin_bunrui),
            IF(
                shohin_bunrui = '衣服',
                CONCAT('A:', shohin_bunrui), NULL
            )
        )
    )
    AS abc_shohin_bunrui
FROM Shohin;
