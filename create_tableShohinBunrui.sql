-- テーブル削除
DROP TABLE ShohinBunrui;

-- データ挿入先の商品コピーテーブル
CREATE TABLE ShohinBunrui
(
    shohin_bunrui  VARCHAR(32)  NOT NULL
    ,sum_hanbai_tanka   INTEGER
    ,sum_shiire_tanka   INTEGER
    ,PRIMARY KEY (shohin_bunrui)
);
