-- 古い構文を使った内部結合
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    TS.shohin_id,
    S.shohin_mei,
    S.hanbai_tanka
FROM TenpoShohin AS TS, Shohin S
WHERE TS.shohin_id = S.shohin_id
AND TS.tenpo_id = '000A';

/*
- 上記構文を利用してはいけない理由
1. 結合の種類が内部結合か外部結合か(またはそれ以外の結合なのか)一目でわかりません。
2. 結合条件がWHERE句で書かれているので、どこまでが結合条件で、どこからがレコードの制限条件なのかすぐにわからない。
3. この構文がいつまで利用可能か心許せない。
    どのDBMSのか開発元も、この古い構文には見切りをつけて、新しい構文だけに対応したいと考えています。
 */
