module Utils where

every :: Int -> [a] -> [a]
every n xs = case drop (n-1) xs of
  (y:ys) -> y : every n ys
  []     -> []

initN :: Int -> [a] -> [a]
initN n xs = (iterate init xs) !! n

tailN :: Int -> [a] -> [a]
tailN n xs = (iterate tail xs) !! n

deepReverse :: (Num n) => [((n, n), (n, n))] -> [((n, n), (n, n))]
deepReverse xs = map (\(a,b) -> (b,a)) (reverse xs)

groupIn :: Int -> [a] -> [[a]]
groupIn _ [] = []
groupIn n xs = [take n xs] ++ groupIn n (drop n xs)
