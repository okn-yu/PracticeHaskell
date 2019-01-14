import Data.Char
type Bit = Int

unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

bit2int :: [Bit] -> Int
bit2int bits = sum [w * b |(w, b) <- zip weights bits]
               where weights = iterate (*2) 1

int2bin :: Int -> [Bit]
int2bin = unfold (==0)(`mod`2)(`div`2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold (null)(take 8)(drop 8)

chop9 :: [Bit] -> [[Bit]]
chop9 = unfold (null)(take 9)(drop 9)

addpbit :: [[Bit]] -> [[Bit]]
addpbit = map (reverse . _addpbit . reverse)

_addpbit :: [Int] -> [Int]
_addpbit xs = n : xs
           where n = calcpbit xs

calcpbit :: [Int] -> Int
calcpbit xs =  if even . sum $ (filter (==1) xs) then 0 else 1

encode :: String -> [Bit]
encode = concat . addpbit . map (make8 . int2bin . ord)

--decode  :: [Bit] -> String
--decode = map (chr . bit2int) . chop8

decode :: [Bit] -> String
decode = map (chr . bit2int . take 8 . checkpbit) . chop9

checkpbit :: [Bit] -> [Bit]
checkpbit xs = if (x == n ) then xs else error "transmit error."
               where n = calcpbit (take 8 xs)
                     x = xs !! 8

transmit :: String -> String
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id
--channel = tail

main = do
    print(transmit("This is a pen."))
