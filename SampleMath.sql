-- DLL：テーブル作成
CREATE TABLE SampleMath
(
    m NUMERIC (10, 3),
    N INTEGER,
    P INTEGER
);

-- DML：データ登録
-- BEGIN TRANSACTION;
START TRANSACTION;

INSERT INTO SampleMath(m, n, p) VALUES (500,    0,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (-180,   0,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL,   NULL,   NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL,   7,      3);
INSERT INTO SampleMath(m, n, p) VALUES (NULL,   5,      2);
INSERT INTO SampleMath(m, n, p) VALUES (NULL,   4,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8,      NULL,   3);
INSERT INTO SampleMath(m, n, p) VALUES (2.27,   1,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (5.555,  2,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL,   1,      NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8.76,   NULL,   NULL);

COMMIT

-- view
SELECT * FROM SampleMath;



-- ABS(数値)
SELECT m,
    ABS(m) AS abs_col
FROM SampleMath;



-- MOD(被除数, 除数)
SELECT n, p,
    MOD(n, p) AS mod_col
FROM SampleMath;
-- SQLServerだけは使うことができない。



-- ROUND(対象数, 丸めの桁数)
SELECT m, n,
    ROUND(m, n) AS round_col
FROM SampleMath;
