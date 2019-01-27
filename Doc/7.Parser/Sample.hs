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

-- プログラミングHaskell練習問題8.10.3 省略
-- プログラミングHaskell練習問題8.10.4 省略
-- プログラミングHaskell練習問題8.10.5 式の評価においてマッチしない評価の実行回数が減少する。そのためパーサーの性能が改善される。


