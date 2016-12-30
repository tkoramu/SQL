/*
 - DISTINCTとGROUP BYは同じ動作をする
    > DISTINCT：選択結果から重複を除外したい
    > GROUP BY：集約した結果を求めたい
*/
SELECT DISTINCT shohin_bunrui
FROM Shohin;

SELECT shohin_bunrui
FROM Shohin
GROUP BY shohin_bunrui;
