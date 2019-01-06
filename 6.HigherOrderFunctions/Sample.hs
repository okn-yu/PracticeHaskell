-- プログラミングHaskellの第7章練習問題の抜粋

-- 1. リスト内包表記 [f x | x <- xs, p x] を高階関数 map と filter を用いて実装
map' f (filter p xs)

-- 2-1. all関数の実装
all' :: (a -> Bool) -> [a] -> Bool
all' p [] = True
all' p (x: xs) |p x = all' p xs
               |otherwise = False
               
-- 2-2. any関数の実装               
any' :: (a -> Bool) -> [a] -> Bool
any' p [] = False
any' p (x: xs) |p x = True
               |otherwise = any' p xs
               
-- 2-3. takeWhile関数の実装
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x: xs) | p x = x : takeWhile' p xs
                     | otherwise = []

-- 2-3. dropWhile関数の実装
dropWhile'  :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x: xs) | p x = []
                     | otherwise = x : dropWhile' p xs

-- 3-1(1). map関数のfoldrを用いた実装
map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f xs = foldr ((:) . f) [] xs

-- 3-1(2). filter関数のfoldrを用いた実装
filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f xs = foldr (\x xs -> if f x then x:xs else xs) [] xs

-- 4. foldl を用いた十進表記を整数に変換する関数の実装
dec2int :: Num a => [a] -> a
dec2int xs = foldr (\n ns -> n + 10 * ns) 0 $ reverse xs

-- 6-1. curry関数の実装
curry' :: ((a, b) -> c) -> a -> b -> c
curry' f  = (\ a -> (\ b -> f (a, b)))

{-
-- 動作確認
*Main> add' = curry(\ (x,y) -> x + y)
*Main> add' 2 3
5
*Main> add'' = curry'(\ (x,y) -> x + y)
*Main> add'' 2 3
5
-}
