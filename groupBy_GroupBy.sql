-- 1つのテーブル内に複数のグループを作成することで、それぞれの結果を出力できる
SELECT shohin_bunrui, COUNT(*)
FROM Shohin
GROUP BY shohin_bunrui;
