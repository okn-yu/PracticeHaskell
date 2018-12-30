-- 第5章の練習問題の解答

-- 1.１から100までの各自然数の2乗の和
sqrtsum = sum[x |x <- [1..100]]

-- 2.replicateの実装
replicate' :: Int -> a -> [a]
replicate' n x = [x| _ <- [1..n]]

-- 3.ピタゴラス数の生成
phyts :: Int -> [(Int, Int, Int)]
phyts n = [(x, y, z)| x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- 4.完全数の生成
factors :: Int -> [Int]
factors n = [x| x <- [1..n], (n `mod` x) == 0]

perfect :: Int -> [Int]
perfect n = [x| x <- [1..n], x == sum (factors x) - x]

-- 5.二つのリスト内包を持つ生成器の書き換え
-- Prelude> concat[[(1, x)| x <- [4, 5, 6]],[(2, x)| x <- [4, 5, 6]]]
Prelude> concat[[(x, y)| y <- [4, 5, 6]]| x <- [1, 2, 3]]
[(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
