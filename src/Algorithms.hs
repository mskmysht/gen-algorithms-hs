module Algorithms
    ( randomSubIndeces
    ) where

import System.Random.SFMT (MonadGen, uniformR)
import Control.Monad.Primitive (PrimMonad)
import Data.Sequence (Seq, update)
import GHC.Exts (fromList)
import Control.Monad (foldM)

randomSubIndeces :: PrimMonad m => MonadGen m -> Int -> Int -> m (Seq Int)
randomSubIndeces gen n l = 
  foldM (\is' i -> do
    j <- uniformR (0, i) gen
    return $ if j < n then update j i is' else is'
    ) (fromList [0 .. (n - 1)]) [n .. l - 1]
  where
    n' = if n > l then l else n