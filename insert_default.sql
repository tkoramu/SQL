-- 明示的なデフォルト値の設定(テーブル作成時にデフォルト値が設定されている)
INSERT INTO ShohinIns
(
    shohin_id
    ,shohin_mei
    ,shohin_bunrui
    ,hanbai_tanka
    ,shiire_tanka
    ,torokubi
)  VALUES (
    '0007'
    ,'おろしがね'
    ,'キッチン用品'
    ,DEFAULT
    ,790
    ,'2009-04-20'
);

-- 暗黙的にデフォルト値の設定(テーブル作成時にデフォルト値が設定されている)
INSERT INTO ShohinIns
(
    shohin_id
    ,shohin_mei
    ,shohin_bunrui
    ,shiire_tanka
    ,torokubi
) VALUES (
    '0007'
    ,'おろしがね'
    ,'キッチン用品'
    ,790
    ,'2009-04-20'
);
