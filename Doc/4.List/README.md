## 内包表記
- 数学の内包表記は既存の集合から新しい集合を生成する
- Haskellでは既存のリストから新しいリストを生成するためのリスト内包表記を利用できる。

## 生成器
- 「x <- [1..n]」のような記載を生成器と呼ぶ

```
phyts :: Int -> [(Int, Int, Int)]
phyts n = [(x, y, z)| x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]
```

## ガード
- 「x^2 + y^2 == z^2」のような論理式をガードと呼ぶ
- ガードは生成器で生成した値を間引く
