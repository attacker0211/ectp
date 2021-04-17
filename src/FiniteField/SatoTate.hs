module FiniteField.SatoTate
  ( quan1
  , quan2
  ) where
import           Data.Maybe
import           Numeric.Tools.Integration      ( defQuad
                                                , quadRes
                                                , quadRomberg
                                                )

-- first quantity in Sato-Tate conjecture
quan1 angs num_primes alpha beta =
  ((/ (fromIntegral num_primes)) . fromIntegral . length)
    $ filter (\x -> x >= alpha && x <= beta) angs

--  second quantity in Sato-Tate conjecture sin^2 distribution
quan2 alpha beta = (* (2 / pi)) $ (fromJust . quadRes) $ flip
  (quadRomberg defQuad)
  ((^ 2) . sin)
  (alpha, beta)
