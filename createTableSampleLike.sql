-- DDL:テーブル作成
CREATE TABLE SampleLike
(
    strcol VARCHAR(6) NOT NULL,
    PRIMARY KEY (strcol)
);

-- DML:データ登録
-- SQL Server, PostgreSQL
-- BEGIN TRANSATION;

-- MySQL
START TRANSACTION;

INSERT INTO SampleLike (strcol) VALUES ('abcddd');
INSERT INTO SampleLike (strcol) VALUES ('dddabc');
INSERT INTO SampleLike (strcol) VALUES ('abdddc');
INSERT INTO SampleLike (strcol) VALUES ('abcdd');
INSERT INTO SampleLike (strcol) VALUES ('ddabc');
INSERT INTO SampleLike (strcol) VALUES ('abddc');

COMMIT;
