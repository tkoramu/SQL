-- UNIONによるテーブルの足し算
SELECT shohin_id, shohin_mei
FROM    Shohin
UNION
SELECT shohin_id, shohin_mei
FROM    Shohin2;

/* 注意事項 */
-- 演算対象となるレコードの列数は同じであること
-- 列数が不一致のためエラー
SELECT shohin_id, shohin_mei
FROM    Shohin
UNION
SELECT shohin_id, shohin_mei, hanbai_tanka
FROM    Shohin2;

-- 足し算の対象となるレコードの列のデータ型一致していること
-- データ型不一致のためエラー
SELECT shohin_id, hanbai_tanka
FROM Shohin
UNION
SELECT shohin_id, torokubi
FROM Shohin2;
-- DBMSによっては、型が異なっていても、気を利かせて暗黙のうちに型変換を行うものもある。
-- しかし、きちんと型を意識して演算するように心がけましょう。

-- SELECT文はどんなものを指定しても良い。
-- ただしORDER BYだけは最後に1つだけ。
SELECT shohin_id, shohin_mei
FROM Shohin
WHERE shohin_bunrui = 'キッチン用品'
UNION
SELECT shohin_id, shohin_mei
FROM Shohin2
WHERE shohin_bunrui = 'キッチン用品'
ORDER BY shohin_id;

-- ALLオプション
SELECT shohin_id, shohin_mei
FROM    Shohin
UNION ALL
SELECT shohin_id, shohin_mei
FROM    Shohin2;
