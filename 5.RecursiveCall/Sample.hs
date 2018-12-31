-- 1.累乗演算子の実装
power :: Int -> Int -> Int
power n m | m == 0 = n
          | n > 0  = n + power n (m - 1)
