#### テーブルを集約して検索

- COUNT関数は引数によって動作が異なる。COUNT(\*)はNULLを含む行数を、COUNT(<列名>)はNULLを除外した行数を数える。

- 集約カンスはNULLを除外する。ただし、「COUNT(\*)」は例外的NULLを除外しない。

- MAX/MIN関数は殆ど全てのデータ型に適用できる。SUM/AVG関数は数値のみにしか使えない。

- 値の種類を数えたいときは、COUNT関数の引数にDISTINCTをつける。

- 重複値を除外して集約するには、集約関数の引数にDISTINCTをつける。


#### テーブルをグループに切り分ける

- 集約関数とGROUP BY句を使うときには、次の4つに注意する必要がある。
    1. SELECT句に書けるものが限定される
        > 定数、集約関数、GROUP BY句で指定した列名(つまり集約キー)

    2. GROUP BY句にはSELECT句で付けた列の別名は使えない
    3. GROUP BY句は集約結果をソートしない
    4. WHERE句に集約関数を書くことはできない

- GROUP BY句はテーブルをカットするナイフである。

- SQLにおいて句の記述順は不変。入れ替えは付加！
    1. 句の記述順序(暫定版)
        > SELECT -> FROM -> WHERE -> GROUP BY

- 集約キーにNULLが含まれる場合、結果にも「不明」行(空行)として現れる。

- HAVING句を使用するときの順序
    > SELECT -> FROM -> WHERE -> GROUP BY -> HAVING

- WHERE句とHAVING句の役割の違い
    > WHERE句=行に対する条件指定
    > HAVING句=グループに対する条件指定
    > 実行速度がWHERE句の方が早い

- ORDER BY句は常にSELECT文の最後尾に書く、順番を指定しない場合は書かなくてもOK
    > SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY

- 昇順、降順
    - 昇順：ASC(ascendent)
    - 降順：DESC(zdescendent)

- ソートキーにNULLが含まれていた場合、先頭か末尾にまとめられる

- ORDER BY の実行順序
    > FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
    > テーブルに存在する列であれば、SELECT句に含まれていない列でも指定できる

- ORDER BY句では、列番号は使わない

#### データの更新

- 原則として、INSERT文は1回の実行で1行を挿入すること
    > 複数行を挿入することもできるが、全てのRDBMSで利用できない。
    > 利用できるもの：DB2、SQL Server、PostgreSQL、MySQL

- 他のテーブルからデータをコピーする
    > INSERT…SELECT文を実行する

- INSERT文内のSELECT文では、WHERE句やGROUP BY 句など、どんなSQL構文も使うことができる
    > ただし、ORDER BY句は使っても効果がない。
