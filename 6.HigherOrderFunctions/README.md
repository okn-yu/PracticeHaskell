Haskellにおいてリスト内包と再帰を理解したら**新しい概念は日本語で読むよりもリストや再帰で書いたほうが伝わりやすい**。

# map関数
## map関数の定義（リスト内包）
```
map :: (a -> b) -> [a] -> [b]
map f xs = [f x| x <- xs]
```

## map関数の定義（再帰）
```
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x: xs) = f x : map f xs
```

# filter関数
## fileter関数の定義（リスト内包）
```
filter :: (a -> Bool) -> [a] -> [a]
filter p xs = [x| x <- xs, p x]
```
# 畳み込み関数foldr
## foldr関数の定義
- リストに対して右結合の演算＊を順番に適用する場合に利用する
- (sum, product, or, and関数などの)再帰処理の記述においてfoldrを用いてると簡潔に書き直すことができる 
 
```
foldr * v0 [v1, v2, v3, ... v_n] = [(v0 * (v1 * (v2 * (v3 * (v4 * v_n)))))
```

- 定義は以下の通り
```
foldr :: (b -> [a] -> b) -> b -> [a] -> b
foldr f v (x: xs) =  foldr f x (forlr f v xs)
```

# 畳み込み関数fldl
## fold関数の定義
