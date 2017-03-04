-- Viewを利用したViewを作成
CREATE VIEW shohinSumJim (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, cnt_shohin
FROM ShohinSum
WHERE shohin_bunrui = '事務用品';

-- Viewが作成されているか確認
SELECT shohin_bunrui, cnt_shohin
FROM shohinSumJim;
