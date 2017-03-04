-- ビューを更新できるケース
CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, toroku)
AS
SELECT *
FROM Shohin
WHERE shohin_bunrui = '事務用品';
