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

-- 3.3 replicate関数の実装
replicate' :: Int -> a -> [a]
replicate' 0 x = []
replicate' n x = replicate' (n - 1) x ++ [x]

-- 3.4 !!関数の実装
exclam :: [a] -> Int -> a
exclam (x: xs) 0 = x
exclam (x: xs) n = exclam xs (n - 1)

-- 3.5 elem関数の実装
elem' :: Eq a => a -> [a] -> Bool
elem' x [] = False
elem' x (y: ys) = if x==y then True else elem' x ys

-- 4. 2つの整列されたリスト同士の整列を行うmerge関数の実装
merge :: Ord a => [a] -> [a] -> [a]
merge x [] = x
merge [] x = x
merge (x: xs) (y: ys) = if x > y then y: (merge ys (x: xs)) else x: (merge xs (y: ys))

-- 5.マージソート関数の実装
msort :: Ord a => [a] -> [a]
msort [x] = [x]
msort xs = merge (msort y1) (msort y2)
                where (y1, y2) halve xs

-- 6-1. sum関数の実装
sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x: xs) = x + (sum' xs)

-- 6-2. take関数の実装
take' :: Int -> [a] -> [a]
take' 0 (x: xs) = []
take' n [] = []
take' n (x: xs) = x : take' (n - 1) xs
