||| Debug timeago specific cases
module DebugTimeago

import Whenwords

%default total

main : IO ()
main = do
  putStrLn "Debugging specific timeago failures..."
  
  -- Test 21 hours ago
  putStrLn "\n=== 21 hours ago ==="
  putStrLn $ "Input: timeago 1703991600 1704067200"
  putStrLn $ "Difference: " ++ show (1704067200 - 1703991600) ++ " seconds"
  putStrLn $ "Hours: " ++ show ((1704067200 - 1703991600) `div` 3600)
  putStrLn $ "Rounded hours: " ++ show (roundToNearest (1704067200 - 1703991600) 3600)
  putStrLn $ "Expected: 21 hours ago"
  putStrLn $ "Actual: " ++ timeago 1703991600 1704067200
  
  -- Test 25 days ago
  putStrLn "\n=== 25 days ago ==="
  putStrLn $ "Input: timeago 1701907200 1704067200"
  putStrLn $ "Difference: " ++ show (1704067200 - 1701907200) ++ " seconds"
  putStrLn $ "Days: " ++ show ((1704067200 - 1701907200) `div` 86400)
  putStrLn $ "Rounded days: " ++ show (roundToNearest (1704067200 - 1701907200) 86400)
  putStrLn $ "Expected: 25 days ago"
  putStrLn $ "Actual: " ++ timeago 1701907200 1704067200
  
  -- Test 1 month ago - 45 days
  putStrLn "\n=== 1 month ago - 45 days ==="
  putStrLn $ "Input: timeago 1700179200 1704067200"
  putStrLn $ "Difference: " ++ show (1704067200 - 1700179200) ++ " seconds"
  putStrLn $ "Months: " ++ show ((1704067200 - 1700179200) `div` 2592000)
  putStrLn $ "Rounded months: " ++ show (roundToNearest (1704067200 - 1700179200) 2592000)
  putStrLn $ "Expected: 1 month ago"
  putStrLn $ "Actual: " ++ timeago 1700179200 1704067200
  
  -- Test 10 months ago - 319 days
  putStrLn "\n=== 10 months ago - 319 days ==="
  putStrLn $ "Input: timeago 1676505600 1704067200"
  putStrLn $ "Difference: " ++ show (1704067200 - 1676505600) ++ " seconds"
  putStrLn $ "Months: " ++ show ((1704067200 - 1676505600) `div` 2592000)
  putStrLn $ "Rounded months: " ++ show (roundToNearest (1704067200 - 1676505600) 2592000)
  putStrLn $ "Expected: 10 months ago"
  putStrLn $ "Actual: " ++ timeago 1676505600 1704067200
  
  putStrLn "\nDebugging completed."