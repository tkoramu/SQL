-- Viewの作成
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;

-- Viewを使用
SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum;
