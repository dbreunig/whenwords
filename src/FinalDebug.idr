||| Final debug for the last failing test
module FinalDebug

import Whenwords

%default total

main : IO ()
main = do
  putStrLn "Debugging final failing test..."
  
  -- Test: 10 months ago - 319 days
  let diff = 1704067200 - 1676505600
  let days = diff `div` 86400
  let months = diff `div` 2592000
  let rounded = roundToNearest diff 2592000
  
  putStrLn $ "Test: 10 months ago - 319 days"
  putStrLn $ "Difference: " ++ show diff ++ " seconds"
  putStrLn $ "Days: " ++ show days
  putStrLn $ "Months (integer division): " ++ show months
  putStrLn $ "Rounded months: " ++ show rounded
  putStrLn $ "Expected: 10 months ago"
  putStrLn $ "Actual: " ++ timeago 1676505600 1704067200
  
  -- Check the exact calculation
  putStrLn $ "\nExact calculation:"
  putStrLn $ "diff `div` 2592000 = " ++ show (diff `div` 2592000)
  putStrLn $ "diff `mod` 2592000 = " ++ show (diff `mod` 2592000)
  putStrLn $ "2592000 `div` 2 = " ++ show (2592000 `div` 2)
  putStrLn $ "Should round up: " ++ show ((diff `mod` 2592000) >= (2592000 `div` 2))
  
  putStrLn $ "\nDebugging completed."