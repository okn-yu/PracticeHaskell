## 型
- Haskellにおいて**型とは関連する値の集合**のこと

## 型安全
- 式の評価前に型検査がなされるため、Haskellのプログラムは型安全であることが保証されている

## 型変数
- 型変数は任意の型を表す
- 型変数は必ず小文字で始まる

## 多相型
- １つ以上の型変数を含む型や、1つ以上の型変数を含む式を多相型と呼ぶ

## 多重定義型
- 型変数は**任意**の型だが、クラス制約を用いることで**取りうる型に制約をつける**ことができる
- 1つ以上のクラス制約を持つ型は多重定義型と呼ぶ

## 型の表記
- 以下の表記により「vは型Tの値」であると表現される

``
v::T
``

## 関数型

- 関数も型をもつ
- 関数型の例は以下
```
Prelude> :type not
not :: Bool -> Bool

Prelude> :type [tail, init, reverse]
[tail, init, reverse] :: [[a] -> [a]]

Prelude> pair x y = (x, y)
Prelude> :type pair
pair :: a -> b -> (a, b)

Prelude> double x = x * x
Prelude> :type double
double :: Num a => a -> a

Prelude> palindrome xs = reverse xs == xs
Prelude> :type palindrome
palindrome :: Eq a => [a] -> Bool

Prelude> twice f x = f(f x)
Prelude> :type twice
twice :: (t -> t) -> t -> t
```
