-- example1
-- (x, y)という1つのタプルを引数として受け取っているため、addは引数を1つとる関数

add :: (Int, Int) -> Int
add (x, y) = x + y

-- *Main> add (1,2)
-- 3

-- example2
-- x, yという2つの引数を受け取っているため、add'は引数を2つとる関数

add' :: Int -> (Int -> Int)
add' x y = x + y

-- *Main> add' 1 2
-- 3
