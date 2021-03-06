- Haskellにおいてリスト内包と再帰を理解したら**新しい概念は日本語で読むよりもリストや再帰で書いたほうが伝わりやすい**。
- mapとfilterはリスト型を返すが、foldrとfoldlはリスト型を返さない

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
- vは値の初期値として機能する
 
```
foldr * x0 [v1, v2, v3, ... v_n] = x0 * (v1 * (v2 * (v3 * (v4 * v_n))))
```

- 定義は以下の通り
```
foldr :: (a -> b -> b) -> b -> [a] -> b　-- 右結合なのでfが型aと型bを引数とした場合は型bを返す
foldr f v [] = v
foldr f v (x: xs) = f x (forlr f v xs)
--                = f x (f x' foldr f v xs')
```

# 畳み込み関数foldl
## foldl関数の定義
- リストに対して左結合の演算＊を順番に適用する場合に利用する
- (sum, product, or, and関数などの)再帰処理の記述においてfoldlを用いてると簡潔に書き直すことができる 
- foldrとfoldlのどちらも利用可能な場合は効率を考慮してどちらの定義を利用するかを決める
- vは値の蓄積先として機能する
 
```
foldl * v0 [v1, v2, v3, ... v_n] = ((((x0 * v1) * v2) * v3 ) * v4) * v_n
```

- 定義は以下の通り
```
foldl :: (a -> b -> a) -> a -> [b] -> a　-- 右結合なのでfが型aと型bを引数とした場合は型aを返す
foldl f v [] = v
foldl f v (x: xs) =  foldl f (f v x) xs
--                =  foldl f (f (f v x) x') xs'
```

# 合成演算
- 失敗例
```
Prelude> :type negate . (+1) 
negate . (+1) :: Num c => c -> c
Prelude> negate . (+1) 1

<interactive>:63:1: error:
    • Non type-variable argument in the constraint: Num (a -> c)
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall c a. (Num c, Num (a -> c)) => a -> c
```
- 成功例
```
Prelude> :type (negate . (+1)) 
(negate . (+1)) :: Num c => c -> c
Prelude> (negate . (+1)) 1
-2
```
