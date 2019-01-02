-- プログラミングHaskellの第7章練習問題の抜粋

-- 1.リスト内包表記 [f x | x <- xs, p x] を高階関数 map と filter を使って書き直すとどうなるか？
map' f (filter p xs)
