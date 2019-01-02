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