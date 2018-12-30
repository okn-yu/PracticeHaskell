--> halve [1, 2, 3, 4]
--([1,2],[3,4])

halve :: [a] -> ([a], [a])
halve xs |even (length xs) = splitAt num xs
      where num = div (length xs) 2
