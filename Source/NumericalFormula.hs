-- プログラミングHaskellの第8章

import Prelude hiding (guard, fail)
import Data.Char

-- newtypeとMonadはおまじない
newtype Parser a = Parser (String -> [(a,String)])
instance Monad Parser where
  return x = Parser (\s -> [(x,s)])
  p >>= q  = Parser (\s -> [(y,s'') |
                            (x,s') <- parse p s,
                            (y,s'') <- parse (q x) s'])


parse :: Parser a -> String -> [(a,String)]
parse (Parser p) s = p s

-- aの型の指定がないため[]を表示する際には型の指定が必要
failure :: Parser a
failure = Parser (\inp -> [])

item :: Parser Char
item = Parser (\inp -> case inp of
                     []     -> []
                     (x:xs) -> [(x,xs)])

-- 連結
p :: Parser(Char, Char)
p = do {x <- item; item; y <- item; return (x, y)}

-- 結合
(+++) :: Parser a -> Parser a -> Parser a
p +++ q = Parser (\inp -> case parse p inp of
                      [] -> parse q inp
                      [(v,out)] -> [(v,out)])

-- パーサーの部品
sat :: (Char -> Bool) -> Parser Char
sat p = do { x <- item; if p x then return x else failure}

digit :: Parser Char
digit = sat isDigit

lower :: Parser Char
lower = sat isLower

upper :: Parser Char
upper = sat isUpper

letter :: Parser Char
letter = sat isAlpha

alphanum :: Parser Char
alphanum = sat isAlphaNum

char :: Char -> Parser Char
char x = sat (== x)

string :: String -> Parser String
string [] = return []
string (x: xs) = do char x
                    string xs
                    return (x: xs)

many :: Parser a -> Parser [a]
many p = many1 p +++ return []
many1 :: Parser a -> Parser [a]
many1 p = do {v <- p; vs <- many p; return(v: vs)}

ident :: Parser String
ident = do {x <- lower; xs <- many alphanum; return(x: xs)}

nat :: Parser Int
nat = do {xs <- many1 digit; return(read xs)}

space :: Parser ()
space = do {many (sat isSpace); return ()}

token :: Parser a -> Parser a
token p = do space
             v <- p
             space
             return v

identifier :: Parser String
identifier = token ident

natural :: Parser Int
natural = token nat

symbol :: String -> Parser String
symbol xs = token (string xs)

spacep :: Parser [Int]
spacep = do symbol "["
            n <- natural
            ns <- many (do symbol ","
                           natural)
            symbol "]"
            return (n: ns)

-- 数式のパーサー
expr :: Parser Int
expr = do t <- term
          do symbol "+"
             e <- expr
             return (t + e)
             +++ return t

term :: Parser Int
term = do f <- factor
          do symbol "*"
             t <- term
             return (f * t)
             +++ return f

factor :: Parser Int
factor = do symbol "("
            e <- expr
            symbol ")"
            return e
            +++ natural

eval :: String -> Int
eval xs = case parse expr xs of
            [(n, [])]  -> n
            [(_, out)] -> error("unused input " ++ out)
            []         -> error "invalid input"

main :: IO ()
main = do
     print((parse failure "abc")::[(Char, String)])
     print(parse item "")
     print(parse item "abc")

     -- 連結の動作確認
     print(parse p "abdedf")

     -- 選択の動作確認
     print(parse (item +++ return 'd') "abc")
     print(parse (failure +++ return 'd') "abc")
     print((parse (failure +++ failure) "abc")::[(Char, String)])

     -- パーサーの部品の動作確認
     print(parse digit "123")
     print(parse digit "abc")
     print(parse (char 'a') "abc")
     print(parse (char 'a') "123")
     print(parse (string "abc") "abcdef")
     print(parse (string "abc") "ab12345")
     print(parse (many digit) "123abc")
     print(parse (many digit) "abcdef")
     print(parse (many1 digit) "abcdef")
     print(parse spacep " [1,2,3] ")

     -- 数式のパーサの動作確認
     print(eval "2*3+4")
     print(eval "2*(3+4)")
     print(eval "2 * (3 + 4)")
     print(eval "2*3-4")
     print(eval "-1")
     
     print("Programing Haskell.")
