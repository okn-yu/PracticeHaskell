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

-- 6.目的の値がリストの何番目に存在するかを確認する関数の実装
find :: Eq a => a -> [(a, b)] -> [b]
find k t = [v| (k', v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x [(x', i)| (x', i) <- zip xs [0..n]]
                 where n = length xs - 1

-- 7.リストの内積を計算する関数の実装
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct x y = sum [x' * y'| (x', y') <- zip x y]

-- 8.シーザー暗号の実装
import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'a'

int2let :: Int -> Char
int2let n =  chr(ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let((let2int c + n) `mod` 26)
          | isUpper c = int2let((let2int c + n) `mod` 26)
          | otherwise = c
