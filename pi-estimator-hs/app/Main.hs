module Main (main) where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [poses] | [(n, _)] <- reads poses ->
      print $ picalc n
    _ -> print $ picalc 2