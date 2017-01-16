-- 正しく更新できるが冗長なUPDATE文
UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 10
WHERE shohin_bunrui = 'キッチン用品';

UPDATE Shohin
SET shiire_tanka = shiire_tanka / 2
WHERE shohin_bunrui = 'キッチン用品';

-- 上の処理を1つのUPDATE文まとめる
UPDATE Shohin
SET hanbai_tanka = hanbai_tanka * 10,
    shiire_tanka = shiire_tanka / 2
WHERE shohin_bunrui = 'キッチン用品';

-- 上の処理をさらにまとめる
UPDATE Shohin
SET (hanbai_tanka, shiire_tanka) = (hanbai_tanka * 10, shiire_tanka / 2)
WHERE shohin_bunrui = 'キッチン用品';
