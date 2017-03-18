-- 大阪店(000C)に置いてある商品(shohin_id)の販売単価(hanbai_tanka)を求める
/*結果*/
-- カッターシャツ(商品ID：0003)
-- 包丁(商品ID：0004)
-- フォーク(商品ID：0006)
-- おろしがね(商品ID：0007)


-- SQLでは2つのステップを行う
-- TenpoShohinテーブルから、大阪店(tenpo_id = '000C')が持っている商品(shohin_id)を選択する
-- Shohinテーブルから、上記で選択した商品(shohin_id)のい販売単価(hanbai_tanka)を選択する

SELECT shohin_id
FROM    TenpoShohin
WHERE tenpo_id = '000C';

-- 大阪店に置いてある商品の販売単価を求める
SELECT shohin_mei, hanbai_tanka
FROM    Shohin
WHERE   shohin_id IN (
    SELECT shohin_id
    FROM    TenpoShohin
    WHERE tenpo_id = '000C'
);

-- NOT INの引数にサブクエリを使う
SELECT shohin_mei, hanbai_tanka
FROM    Shohin
WHERE   shohin_id NOT IN (
    SELECT shohin_id
    FROM    TenpoShohin
    WHERE tenpo_id = '000A'
);
