-- 第5章の練習問題の解答

-- 1.１から100までの各自然数の2乗の和
sqrtsum = sum[x |x <- [1..100]]

-- 2.replicateの実装
replicate' :: Int -> a -> [a]
replicate' n x = [x| _ <- [1..n]]

-- 3.与えられた範囲内のピタゴラス数の取得
phyts :: Int -> [(Int, Int, Int)]
phyts n = [(x, y, z)| x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]
