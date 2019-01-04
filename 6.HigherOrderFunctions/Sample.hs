-- プログラミングHaskellの第7章練習問題の抜粋

-- 1.リスト内包表記 [f x | x <- xs, p x] を高階関数 map と filter を用いて実装
map' f (filter p xs)

-- 2-1.all関数の実装
all' :: (a -> Bool) -> [a] -> Bool
all' p [] = True
all' p (x: xs) |p x = all' p xs
               |otherwise = False
               
-- 2-2.any関数の実装               
any' :: (a -> Bool) -> [a] -> Bool
any' p [] = False
any' p (x: xs) |p x = True
               |otherwise = any' p xs
               
-- 2-3.takeWhile関数の実装
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x: xs) | p x = x : takeWhile' p xs
                     | otherwise = []

-- 2-3.dropWhile関数の実装
dropWhile'  :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x: xs) | p x = []
                     | otherwise = x : dropWhile' p xs

-- 3-1. map関数のfoldrを用いた実装
map' :: (a -> b) -> [a] -> [b]
map' f [] = []
--map' f (x: xs) = f x : map' f xs

map' f xs = foldr (:) [] xs 
