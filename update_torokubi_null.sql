-- 商品IDが「0008」のボールペンの登録日をNULLに変更
UPDATE Shohin
SET torokubi = NULL
WHERE shohin_id = '0008';
