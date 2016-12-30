-- *だと3と表示され、カラムを指定するとNullなので0と表示される
SELECT COUNT(*), COUNT(col_1)
FROM NullTb1;
