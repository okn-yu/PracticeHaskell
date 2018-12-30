-- > halve [1, 2, 3, 4]
--([1,2],[3,4])

halve :: [a] -> ([a], [a])
halve xs |even (length xs) = splitAt num xs
      where num = div (length xs) 2
      
-- safetail 1      
safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs

-- safetail 2
safetail xs |null xs = []
            |otherwise = tail xs
            
-- safetail 3
safetail (_: xs) = xs
safetail [] = []
