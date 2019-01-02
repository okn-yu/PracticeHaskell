# map関数の定義（リスト内包）
```
map :: (a -> b) -> [a] -> [b]
map f xs = [f x| x <- xs]
```

# map関数の定義（再帰）
```
map :: (a -> b) -> [a] -> [b]
map f (x: xs) = f x : map f xs
```
