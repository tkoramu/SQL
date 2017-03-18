-- 仕入単価(shiire_tanka)がNULLの商品を選択
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NULL;

-- 仕入単価(shiire_tanka)がNULL以外の商品を選択
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IS NOT NULL;
