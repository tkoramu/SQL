-- create View
CREATE VIEW ViewRenshu5_1
AS
SELECT
    shohin_mei,
    hanbai_tanka,
    torokubi
FROM
    Shohin
WHERE
    hanbai_tanka >= 1000
AND torokubi = '2009-09-20';

-- use View
SELECT * FROM ViewRenshu5_1;
