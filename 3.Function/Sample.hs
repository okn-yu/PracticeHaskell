-- プログラミングHaskellの第4章の練習問題から抜粋

-- > halve [1, 2, 3, 4]
--([1,2],[3,4])

halve :: [a] -> ([a], [a])
halve xs |even (length xs) = splitAt num xs
      where num = div (length xs) 2
      
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
