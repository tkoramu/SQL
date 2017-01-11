-- 一部の行だけお削除する探索型DELETE
DELETE FROM Shohin
WHERE hanbai_tanka >= 4000;

-- 削除結果の確認
SELECT * FROM Shohin;
