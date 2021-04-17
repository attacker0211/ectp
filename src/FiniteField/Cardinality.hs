module FiniteField.Cardinality
  ( points
  , sieve
  , angle1
  , angle2
  , num_points
  ) where
import           Control.Applicative


sieve :: [Int]
sieve = sieve' [2 ..]
  where sieve' (x : xs) = x : sieve' (filter (\n -> n `mod` x /= 0) xs)

f x y = x ^ 3 + x + 1 - y ^ 2

points p =
  [ (x, y) | x <- [0 .. (p - 1)], y <- [0 .. (p - 1)], (f x y) `mod` p == 0 ]

num_points sieve = ((+ 1) . length . points) <$> sieve

angle :: Int -> Int -> Double
angle n p =
  let p'  = fromIntegral p
      n'  = fromIntegral n
      deg = (n' - p' - 1) / (2 * sqrt (p'))
  in  acos (deg)

angle1 sieve = zipWith angle (num_points sieve) sieve
angle2 cards sieve = zipWith angle cards sieve

