-- テーブルを作成
CREATE TABLE Chars
(
    chr CHAR(3) NOT NULL,
    PRIMARY KEY (chr)
);

-- データを挿入
INSERT INTO Chars VALUES ('1');
INSERT INTO Chars VALUES ('2');
INSERT INTO Chars VALUES ('3');
INSERT INTO Chars VALUES ('10');
INSERT INTO Chars VALUES ('11');
INSERT INTO Chars VALUES ('222');

-- データを登録
COMMIT;
