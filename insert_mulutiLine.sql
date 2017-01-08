-- 通常のINSERT
INSERT INTO ShohinIns VALUES (
    '0002'
    ,'穴あけパンチ'
    ,'事務用品'
    ,500
    ,320
    ,'2009-09-11'
);
INSERT INTO ShohinIns VALUES (
    '0003'
    ,'カッターシャツ'
    ,'衣服'
    ,4000
    ,2800
    ,NULL
);
INSERT INTO ShohinIns VALUES (
    '0004'
    ,'包丁'
    ,'キッチン用品'
    ,3000
    ,2800
    ,'2009-09-20'
);
INSERT INTO ShohinIns VALUES (
    '0005'
    ,'圧力鍋'
    ,'キッチン用品'
    ,6800
    ,5000
    ,'2009-01-15'
);

-- 複数行INSERT(Oracle以外)
INSERT INTO ShohinIns VALUES (
    '0002'
    ,'穴あけパンチ'
    ,'事務用品'
    ,500
    ,320
    ,'2009-09-11'
)
,(
    '0003'
    ,'カッターシャツ'
    ,'衣服'
    ,4000
    ,2800
    ,NULL
)
,(
    '0004'
    ,'包丁'
    ,'キッチン用品'
    ,3000
    ,2800
    ,'2009-09-20'
);
