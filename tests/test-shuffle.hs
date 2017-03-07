import Control.Monad
import Data.List
import System.Exit
import System.Random
import Test.QuickCheck
import Test.QuickCheck.Test

import System.Random.Shuffle


quickTest :: Testable prop => prop -> IO ()
quickTest prop = do
  res <- quickCheckResult prop
  unless (isSuccess res) $ exitFailure

prop_shuffleListIsConsistent :: Int -> [Int] -> Bool
prop_shuffleListIsConsistent seed list = sort list == sort shuffledList
  where shuffledList = fst $ shuffleGen list $ mkStdGen seed


main = quickTest prop_shuffleListIsConsistent
