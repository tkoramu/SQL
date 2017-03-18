-- 販売範囲が100〜1000円の商品を選択
SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka BETWEEN 100 AND 1000;

-- 販売単価が101~999円の商品を選択
SELECT shohin_mei, hanbai_tanka
FROM Shohin
WHERE hanbai_tanka > 100
AND hanbai_tanka < 1000;
