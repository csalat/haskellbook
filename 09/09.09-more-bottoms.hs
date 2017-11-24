import           Data.Bool (bool)

-----------------------------------------------------------------------------
-- 1.
-- take 1 $ map (+1) [undefined, 2, 3]
-- Answer:
-- Bottom

-----------------------------------------------------------------------------
-- 2.
-- take 1 $ map (+1) [1, undefined, 3]
-- Answer:
-- [2]

-----------------------------------------------------------------------------
-- 3.
-- take 2 $ map (+1) [1, undefined, 3]
-- Answer:
-- Bottom

-----------------------------------------------------------------------------
-- 4.
itIsMystery :: String -> [Bool]
itIsMystery xs = map (\x -> elem x "aeiou") xs
-- returns a list of boolean values where a vowel returns True

-----------------------------------------------------------------------------
-- 5.
-- a) map (^2) [1..10]
-- [1,4,9,16,25,36,49,64,81,100]
-- b) map minimum [[1..10], [10..20], [20..30]]
-- [1,10,20]
-- c) map sum [[1..5], [1..5], [1..5]]
-- [15,15,15]

-----------------------------------------------------------------------------
-- 6.
mapBool :: (Num b, Eq b) => [b] -> [b]
mapBool = map (\x -> bool x (-x) (x == 3))