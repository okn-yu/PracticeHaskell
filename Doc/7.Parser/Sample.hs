-- プログラミングHaskell練習問題8.10.1
-- 整数のパーサーの実装
integer :: Parser Int
integer = do symbol "-"
             e <- natural
             return (-e)
             +++ natural
             
-- プログラミングHaskell練習問題8.10.2
-- 普通のコメントのパーサーの実装
comment :: Parser ()
comment = do symbol "--"
             many notEOL
             char '\n'
             return ()
             +++ return ()
          where notEOL = sat (/='\n')
