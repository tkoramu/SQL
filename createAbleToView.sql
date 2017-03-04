-- ビューを更新できるケース
CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, toroku)
AS
SELECT *
FROM Shohin
WHERE shohin_bunrui = '事務用品';

-- ビューを使用して更新する
INSERT INTO ShohinJim VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- ビューに追加されていることの確認
SELECT * FROM ShohinJim;

-- 元のテーブルに追加されていることの確認
SELECT * FROM Shohin;
