-- 商品分類が「キッチン用品」の行のみ販売単価を10倍に変更
UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 10
WHERE shohin_bunrui = 'キッチン用品';
