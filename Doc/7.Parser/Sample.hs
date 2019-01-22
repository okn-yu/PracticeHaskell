-- プログラミングHaskell練習問題8.10
-- 整数のパーサーの実装
integer :: Parser Int
integer = do symbol "-"
             e <- natural
             return (-e)
             +++ natural
