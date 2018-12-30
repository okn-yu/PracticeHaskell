-- プログラミングHaskellの第4章の練習問題から抜粋

-- 問題1 以下の関数の実装
-- > halve [1, 2, 3, 4]
--([1,2],[3,4])

halve :: [a] -> ([a], [a])
halve xs |even (length xs) = splitAt num xs
      where num = div (length xs) 2
 
-- 問題2 []を受け取れるtail関数の実装3通り
-- safetail 1      
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

-- safetail 2
safetail :: [a] -> [a]
safetail xs |null xs = []
            |otherwise = tail xs
            
-- safetail 3
safetail :: [a] -> [a]
safetail (_: xs) = xs
safetail [] = []

-- 問題3 or演算子の実装4通り
-- ||演算子の再実装 1
v :: Bool -> Bool -> Bool
True `v` True = True
True `v` False = True
False `v` True = True
False `v` False = False

-- ||演算子の再実装 2 
v :: Bool -> Bool -> Bool
True `v` _ = True
False `v` True = True
False `v` _ = False

-- ||演算子の再実装 3
v :: Bool -> Bool -> Bool
False `v` False = False
_ `v` _ = True

-- ||演算子の再実装 4
v :: Bool -> Bool -> Bool
False `v` b = b
True `v` _  = True

-- 問題4 以下の演算子の書き直し
-- True ^ True = True
-- _ ^ _ = False

and' :: Bool -> Bool -> Bool
a `and'` b = if (a == True && b == True) then True else False

-- 問題5 演算子の書き直し
-- True ^ b = b
-- False ^ _ = False

and'' :: Bool -> Bool -> Bool
a `and''` b = if a == True then b else False

-- 問題5 関数のラムダ式に書き直し
-- mult x y z = x * y * z
mult = \x -> (\y -> (\z -> x * y * z))

-- 注　無名関数も上のように関数名と紐付けが可能
