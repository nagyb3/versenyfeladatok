module Main where

import Data.List (sort)

solver :: Int -> [Int] -> Int
solver n ls
  | n `mod` 2 == 1 = solverH (ls !! (n `div` 2)) ls
  | otherwise  = solverH ((ls !! ((n `div` 2) - 1) + ls !! (((n `div` 2) - 2) + 1)) `div` 2) ls

solverH :: Int -> [Int] -> Int
solverH _ [] = 0
solverH middleValue (x:xs) = abs (x - middleValue) + solverH middleValue xs

main :: IO()
main = do
  nLine <- getLine
  let n = read nLine :: Int
  numbersLine <- getLine
  let inputls = map read (words numbersLine) :: [Int]
  print (solver n (sort inputls))
