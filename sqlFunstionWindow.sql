-- 商品分類別に、販売単価の安い順で並べたランキング表を作る
-- Oracle, SQL Server, DB2, PostgreSQL
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER (PARTTION BY shohin_bunrui
                    ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- PARTITION BYは、順位を付ける対象の範囲を設定している
-- ORDER BYは、どの列をどんな順序で順位付けるかを指定している


-- PARTITION BYを指定しない場合
-- 今度はテーブル全体でのランキングに変わった
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin;

-- RANK, DENSE_RANK, ROW_NUMBERの結果を比較
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER (ORDER BY hanbai_tanka) AS ranking,
    DENSE_RANK () OVER (ORDER BY hanbai_tanka) AS dense_ranking,
    ROW_NUMBER () OVER (ORDER BY hanbai_tanka) AS row_num
FROM Shohin;


-- SUM関数をウィンドウ関数として使う
SELECT shohin_id, shohin_mei, hanbai_tanka,
    SUM (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_sum
FROM Shohin;


-- AVG関数をウィンドウ関数として使う
SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_avg
FROM Shohin;


-- 集計対象のレコードを「直近の3行」にする
SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG (hanbai_tanka) OVER (ORDER BY shohin_id
                                ROW 2 PRECEDING) AS moving_avg
FROM Shohin;

-- カレントレコードの前後の行を集計対象に含める
SELECT shohin_id, shohin_mei, hanbai_tanka,
    AVG (hanbai_tanka) OVER (ORDER BY shohin_id
                                ROW 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM Shohin;


-- 文末のORDER BY句によって結果の並び順が保証される
SELECT shohin_mei, shohin_bunrui, hanbai_tanka,
    RANK () OVER (ORDER BY hanbai_tanka) AS ranking
FROM Shohin
ORDER BY ranking;



-- GROUP BY句では合計行を求められない
SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

-- 合計行と集約結果を個別に求めUNION ALLでくっつける
SELECT '合計' AS shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
UNION ALL
SELECT shohin_bunrui, SUM(hanbai_tanka)
FROM Shohin
GROUP BY shohin_bunrui;

-- ROLLUPで合計行と小計を一度に求める
-- MySQLでは「GROUP BY shohin_bunrui WITH ROLLUP;」に変更
SELECT shohin_bunrui, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui);

-- GROUP BY句で「登録日」を追加(ROLLUPなし)
SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY shohin_bunrui, torokubi;

-- GROUP BY句で「登録日」を追加(ROLLUPあり)
-- MySQLの場合は「GROUP BY shohin_bunrui, torokubi WITH ROLLUP;」
SELECT shohin_bunrui, torokubi, SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- GROUPING関数でNULLを判別する
SELECT
    GROUPING(shohin_bunrui) AS shohin_bunrui,
    GROUPING(torokubi) AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);

-- 超集合行のキー値に適当な文字列を埋め込む
SELECT
    CASE WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui END AS shohin_bunrui,
    CASE WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY ROLLUP(shohin_bunrui, torokubi);


-- CUBEで可能な全ての組み合わせを取得する
SELECT
    CASE WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui END AS shohin_bunrui,
    CASE WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY CUBE(shohin_bunrui, torokubi);


-- GROUPING SETSで部分的な組み合わせを取得する
SELECT
    CASE WHEN GROUPING(shohin_bunrui) = 1
        THEN '商品分類 合計'
        ELSE shohin_bunrui END AS shohin_bunrui,
    CASE WHEN GROUPING(torokubi) = 1
        THEN '登録日 合計'
        ELSE CAST(torokubi AS VARCHAR(16)) END AS torokubi,
    SUM(hanbai_tanka) AS sum_tanka
FROM Shohin
GROUP BY GROUPING SETS (shohin_bunrui, torokubi);
