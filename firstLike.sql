-- 前方一致
SELECT *
FROM SampleLike
WHERE strcol like 'ddd%';

-- 中間一致
SELECT *
FROM SampleLike
WHERE strcol like '%ddd%';

-- 後方一致
SELECT *
FROM SampleLike
WHERE strcol like '%ddd';

-- LIKEと_(アンダーバー)による後方一致
SELECT *
FROM SampleLike
WHERE strcol LIKE 'abc__';

-- abc+任意の3文字を検索
SELECT *
FROM SampleLike
WHERE strcol LIKE 'abc___';
