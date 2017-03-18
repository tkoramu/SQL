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

- データの削除方法は大きく分けて2つある
    > DROP TABLE：テーブルそのものを削除する
    > DELETE文：テーブルは残したまま、テーブル内の全ての行を削除する

- テーブル内の全行を削除する方法
    > DELETE FROM テーブル名;
    > 標準以外に「TRUNCATE」というコマンドがあります。これは、DELETEよりも高速なのですが、Oracle SQL Server、PostgreSQL、MySQL、DB2しか持っていません。
    > また、WHERE句も使用できません。加えて、Oracleでは暗黙的にCOMMITされるので

- 一部の行を削除する方法
    > WHERE句で対象行の条件を記述する
    > GROUP BY、HAVING、ORDER BYの3つの句は指定できない

- 探索型UPDATE文
    > WHERE句がない場合は全ての行を更新
    > WHERE句を使用すると対象の行だけ更新

- NNULLで更新する
    > 列をNULLで更新することもできる
    > UPDATE文で値をNULLクリアすることもできる(ただし、NOT NULL制約のついていない列に限る)

- トランザクション(transaction)
    > 一般的には「商取引」や「経済活動」という意味で使いますが、RDBMSの世界においては、「データベースに対する1つ以上の更新をまとめて呼ぶときの名称」

    > トランザクションの開始文
    > - SQL Server、PostgreSQL
    >   > BEGIN TRANSACTION
    > - MySQL
    >   > START TRANSACTION
    > - Oracle、DB2
    >   > ない

- COMMIT 処理の確定 => トランザクションの終了文
    > トランザクションに含まれていた処理による変更をすべて反映して、トランザクションを終了するコマンドです。
    > 一度コミットしたら、もうトランザクションの開始前の状態に戻すことはできない。
    > 最悪の場合、データを復元できないケースもあるので、要注意！

- ROLLBACK 処理の取り消し => トランザクションの終了文
    > トランザクションに含まれていた処理による変更をすべて破棄して、トランザクションを終了するコマンドです。
    > ロールバックすると、データベースの状態はトランザクションを開始する前の状態に戻ります。
    > 一般的に、コミットと違ってロールバックが大きなデータ損失につながることはありません。

- ACID特性
    > - 原子性(Atomicity)
    >   > トランザクションが終了した時、そこに含まれていた更新処理は、全て実行されるか、または全て実行されない状態で終わることを保証する性質。
    > - 一貫性(Consistency)
    >   > トランザクションに含まれる処理は、データベースにあらかじめ設定された制約を満たす性質。
    >   > なお、一貫性は「整合性」とも呼びます。
    > - 独立性(Isolation)
    >   > トランザクション同士が互いに干渉を受けないことを保証する性質。
    >   > これによって、あるトランザクションの変更は、トランザクション終了時まで開始しない。
    > - 永続性(Durability)
    >   > これは耐久性といっても良いのですが、トランザクションが終了したら、その時点でのデータの状態が保存されることを保証する性質。

####  ビュー

- ビュー(view)
    > SELECT文を組み立てる際には、テーブルとビューの違いはない。

        通常、テーブルを作成後、INSERT文でデータを格納すると、データベースにデータを保存できる。
        このデータが実際に保存されるのはどこかというと、コンピュータ内の記憶装置(一般的にはハードディスク)です。
        従って、SELECT文でデータを検索しようとするときは、実際にはこの記憶装置からデータを引っ張り出して、色々な計算を行い、ユーザに結果を返す、という過程をたどる。

        一方、ビューの場合、データを記憶装置に保存しません。
        ではどこにデータを保存しているかというと、どこにも保存していないのです。
        実は、ビューが保存しているのは「SELECT文」そのものなのです。

        私たちがビューからデータを取り出そうとするときに、ビューは内部的にそのSELECT文を実行し、一時的に仮想のテーブルを作る。

#### ビューのメリットは、大きく分けて2つある。
1. データを保存しないため、記憶装置の容量を節約できる
2. 使用頻度の多いSELECT文を、毎回書かなくても、ビューとして保存できる

#### ビューの定義
どんなSELECT文でも書くことができる。
> WHERE、GROUP BY、HAVINGも使用でき、「SELECT *」のように全列を指定可能

#### ビューに対する検索
1. 最初に、ビューに定義されたSELECT文が実行される
2. その結果に対し、ビューをFROM句に指定したSELECT文が実行される

        つまり、ビューに対する検索では、常に2つ以上のSELECT文が実行されるのです。
        「2つ以上」という言葉を使ったのは、ビューを元にさらにビューを作る「多段ビュー」も可能だからです。

        ビューの上にビューを重ねることは、なるべく避ける。
        多くのDBMSにおいて、ビューを重ねることはパフォーマンス低下を招くからです。

#### ビューの制限事項
- ビュー定義でORDER BY句は使えない
        テーブル同様、ビューについても「行には順序がない」と定められているからです。
        実際には使えるDBMSもありますが、一般的に通用する構文ではありません。

- ビューに対する更新
        INSERT、DELETE、UPDATEといった更新系SQLにおいては
        1. SELECT句にDISTINCTが含まれていない
        2. FROM句に含まれるテーブルが1つだけである
        3. GROUP BY句を使用していない
        4. HAVING句を使用していない

- なぜ、制限があるのか
        ビューはあくまでテーブルから派生して作られている。
        ですから、元となるテーブルが変更されれば、ビューのデータ内容も変更される。
        逆もしかりで、ビューが変更されれば、テーブルもそれに合わせて変更されないと、両者の整合性がとれない。

- PostgreSQLでビューの更新を許可する設定
    > 初期設定時には読み取り専用となっている可能性がある

        CREATE OR REPLACE RULE insert_rule
        AS ON INSERT
        TO ビュー名 DO INSTEAD
        INSERT INTO テーブル名 VALUES (
            new.カラム名
        )

#### ビューを削除する
ビューを削除するにはDROP VIEW文を使う
        PostgreSQLの場合、多段ビューの作成元となっているビューを削除する場合に、それに依存するビューが存在すると次のようなエラーになる。
        その場合は、以下のようにCASCADEオプションを付けて実行
        DROP VIEW ShohinSum CASCADE;

#### サブクエリ
- 使い捨てのビュー(SELECT文)、ビューと異なり、SELECT文の実行終了後に消去される
- サブクエリには名前をつける必要がある
- スカラ・サブクエリとは「必ず1行1列だけの結果を返す」という制限をつけたサブクエリのこと
- サブクエリの階層数は原則的に制限がない
    - ただし、サブクエリの階層が深くなるほど、SQL文が読みにくく、パフォーマンスにも悪影響を与える

#### サブクエリの名前
- 名前は、原則的に必要なもの
- 処理内容から考えて適切な名前をつける
- 名前をつけるときには「AS」を付けるが、このASは省略することが可能

#### スカラ・サブクエリ(scalar subquery)
- スカラとは
    - 「単一の」という意味の言葉で、データベース以外の分野でも使われる
    - 「必ず1行1列だけの戻り値を返す」という制限をつけたサブクエリのこと

#### 相関サブクエリ
- サブクエリの中にしか書けない

#### 述語(predicate)
- SQLで抽出条件を記述する時に不可欠な道具
- 条件は「戻り値が真理値になること」
- 真理値(TURE/FALSE/UNKNOWN)
- 種類
> LIKE
    - 少しあいまいで、文字列の部分一致検索を行うときに使う
    - パターンマッチングを行う
    - %:0文字以上の任意の文字列、_:任意の1文字
> BETWEEN
    - 範囲検索を行う
    - 引数を3つ使う
    - ANDの両端の値も含んで検索
> IS NULL, IS NOT NULL
    - NULLか非NULLかの判定
> IN
    - ORの便利な省略形
> EXISTS
