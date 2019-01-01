-- プログラミングHaskellの第5章練習問題の解答

-- 1. 累乗演算子の実装
power :: Int -> Int -> Int
power n m | m == 0 = n
          | n > 0  = n + power n (m - 1)

-- 3-1. and関数の実装
and' :: [Bool] -> Bool
and' [] = True
and' (False: _) = False
and' (True: xs) = and' xs

-- 3.2 concat関数の実装 
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x: xs) = x ++ concat' xs
