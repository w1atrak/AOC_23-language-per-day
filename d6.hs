
good_races :: (Int, Int) -> [Int]
good_races (x, y) = filter (>y) [i*(x-i) | i <- [1..x-1]]


aoc_6_1 :: IO ()
aoc_6_1 = print (product (map (length.good_races) [(60,601),(80,1163),(86,1559),(76,1300)]))


aoc_6_2 :: IO ()
aoc_6_2 = print (product (map (length.good_races) [(60808676,601116315591300)]))


main :: IO ()
main = aoc_6_1 >> aoc_6_2
