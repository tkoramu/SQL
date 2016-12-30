-- 集約キーにNULLが含まれる場合、結果にも「不明」行(空行)として現れる
SELECT shiire_tanka, COUNT(*)
FROM Shohin
GROUP BY shiire_tanka;
