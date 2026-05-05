module Main where

import Data.List (sort)
import Control.Category ((>>>))
import Data.Set qualified as S
import Data.ByteString.Lazy.Char8 qualified as BS

solver :: Int -> [Int] -> Int
solver _ [] = 0
solver middleValue (x:xs) = abs (x - middleValue) + solver middleValue xs

main :: IO()
main = BS.interact $
  BS.lines >>> \allLines ->
    let n = read (BS.unpack (head allLines)) :: Int
        sortedls = sort $ map (read . BS.unpack) (concatMap BS.words (tail allLines))
        median = sort sortedls !! (n `div` 2)
    in BS.pack $ show $ solver median sortedls
