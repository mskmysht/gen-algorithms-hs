module Main where

import Algorithms

import System.Random.SFMT (initializeFromSeed)
import GHC.Exts (fromList)

main :: IO ()
main = do
  gen <- initializeFromSeed 0
  ss <- randomSubIndeces gen 5 10
  print ss