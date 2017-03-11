-- DDL：テーブル作成
CREATE TABLE SampleStr
(
    str1    VARCHAR(40),
    str2    VARCHAR(40),
    str3    VARCHAR(40)
);

-- DML：データ登録
-- BEGIN TRANSACTION;
START TRANSACTION;

INSERT INTO SampleStr (str1, str2, str3) VALUES ('あいう', 'えお', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc', 'def', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('山田', '太郎', 'です');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aaa', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES (NULL, 'あああ', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('@!#$%', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ABC', 'えお', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc', 'えお', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc太郎', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abcdefabc', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ミックマック', 'ッ', 'つ');

COMMIT;

-- view
SELECT * FROM SampleStr;
