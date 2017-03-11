-- FROM句に直接ビュー定義のSELECT文を書く
SELECT shohin_bunrui, cnt_shohin
FROM (
    SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
    FROM Shohin
    GROUP BY shohin_bunrui
) AS ShohinSum;

-- Oracleの場合は、FROM句でASが使えない為、「) ShohinSum;」と変更する必要がある。
/*
まず、FROM句の中のSELECTが実行される
その後、外側のSELECT文が実行される
*/
