-- ORで複数の仕入単価を指定して検索
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka = 320
OR  shiire_tanka = 500
OR  shiire_tanka = 5000;

-- Inで複数の仕入単価を指定して検索
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka IN (320, 500, 5000

-- NOT INで件s買う時に除外する仕入単価を複数指定して検索
SELECT shohin_mei, shiire_tanka
FROM Shohin
WHERE shiire_tanka NOT IN (320, 500, 5000);
