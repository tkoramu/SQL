-- CAST
-- 文字型から数値型への変換
-- SQLServer, PostgreSQL
SELECT CAST('0001' AS INTEGER) AS int_col;

-- MySQL
SELECT CAST('0001' AS SIGNED) AS int_col;

-- Oracle
SELECT CAST('0001' AS INTEGER) AS int_col;
FROM DUAL;

-- DB2
SELECT CAST('0001' AS INTEGER) AS int_col;
FROM SYSIBM.SYSDUMMY1;


-- 文字型から日付への変換
-- SQLServer, PostgreSQL, MySQL
SELECT CAST('2009-12-14' AS DATE) AS date_col;

-- Oracle
SELECT CAST('2009-12-14' AS DATE) AS date_col;
FROM DUAL;

-- DB2
SELECT CAST('2009-12-14' AS DATE) AS date_col;
FROM SYSIBM.SYSDUMMY1;


-- COALESCE
-- SQLServer, PostgreSQL, MySQL
SELECT COALESCE(NULL, 1)                AS col_1,
    COALESCE(NULL, 'test', NULL)        AS col_2,
    COALESCE(NULL, NULL, '2009-11-01')  AS col_3;

-- Oracle
SELECT COALESCE(NULL, 1)                AS col_1,
    COALESCE(NULL, 'test', NULL)        AS col_2,
    COALESCE(NULL, NULL, '2009-11-01')  AS col_3
FROM DUAL;

-- DB2
SELECT COALESCE(NULL, 1)                AS col_1,
    COALESCE(NULL, 'test', NULL)        AS col_2,
    COALESCE(NULL, NULL, '2009-11-01')  AS col_3;
FROM SYSIBM.SYSDUMMY1;

-- SampleStrテーブルの列を利用したサンプル
SELECT COALESCE(str2, 'NULLです')
FROM SampleStr;
