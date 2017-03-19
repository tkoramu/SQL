-- SQL Server, DB2, PostgreSQL, MySQL
-- Oracleの場合はASを削除
SELECT
    TS.tenpo_id,
    TS.tenpo_mei,
    TS.shohin_id,
    S.shohin_mei
FROM TenpoShohin AS TS CROSS JOIN Shohin AS S;

/*
クロス結合の場合、内部結合や外部結合で使ったON句は指定することができません。
クロス結合は、2つのテーブルレコードについて、すべての組み合わせを作る結合方法だからです。
上記の場合だと、TenpoShohinテーブルが13行、Shohinテーブルが8行のため、13*8=104行の結果が作られる。

- このクロス結合が使われない理由
1. 結果にほとんど使い道がないこと
2. 結果行数が非常に多いため、演算に多くの時間とマシンパワーを使ってしまうこと
 */
