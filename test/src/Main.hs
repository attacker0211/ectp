import           FiniteField.Cardinality
import           FiniteField.SatoTate

import           Control.Monad

bound = 1000

printCard s cards angs = forM_ [0 .. length s - 1] $ \i -> do -- print (a) 
  putStrLn
    $  "p &= "
    ++ show (s !! i)
    ++ ": M_p = "
    ++ show (cards !! i)
    ++ ", \\theta_p = "
    ++ show ((angs !! i) * 180.0 / pi)
    ++ "\\\\"

printDif angs num_primes = forM_ [1 .. 10] $ \i -> do
  let a  = pi / 2 - (pi / 20) * i
  let b  = pi / 2 + (pi / 20) * i
  let q1 = quan1 angs num_primes a b
  let q2 = quan2 a b
  putStrLn
    $  "\\alpha &= \\frac{\\pi}{2}- "
    ++ show i
    ++ "\\cdot\\frac{\\pi}{20}"
    ++ ", \\beta = \\frac{\\pi}{2} + "
    ++ show i
    ++ "\\cdot\\frac{\\pi}{20}"
    ++ ": \\\\q_1 &= "
    ++ show q1
    ++ ", q_2 = "
    ++ show q2
    ++ ", \\Delta = "
    ++ show (abs (q1 - q2))
    ++ "\\\\"

main = do
  let s     = takeWhile (<= bound) sieve
  let cards = num_points s
  let angs  = angle2 cards s
  printCard s cards angs
  printDif angs (length s)
