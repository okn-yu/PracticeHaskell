## Parserの型
- 文字列を受け取り、ASTおよび消費しきれなかった文字列を返却する
```
Parser :: String -> (Tree, String)
```
- 失敗する場合は空リストを返すようにリストを返却する
```
Parser :: String -> [(Tree, String)]
```
- ASTを抽象化する
- 数値パーサーは数値を受け取るとASTではなく数値を返すのが望ましい
```
Parser a :: String -> [(a, String)]
```
