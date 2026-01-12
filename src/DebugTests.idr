||| Debug specific failing tests
module DebugTests

import Whenwords

%default total

main : IO ()
main = do
  putStrLn "Debugging specific failing tests..."
  
  -- Test 21 hours ago
  putStrLn "\n=== 21 hours ago ==="
  putStrLn $ "Expected: 21 hours ago"
  putStrLn $ "Actual: " ++ timeago 1703991600 1704067200
  putStrLn $ "Difference: " ++ show (1704067200 - 1703991600) ++ " seconds"
  putStrLn $ "Hours: " ++ show ((1704067200 - 1703991600) `div` 3600)
  
  -- Test 25 days ago
  putStrLn "\n=== 25 days ago ==="
  putStrLn $ "Expected: 25 days ago"
  putStrLn $ "Actual: " ++ timeago 1701907200 1704067200
  putStrLn $ "Difference: " ++ show (1704067200 - 1701907200) ++ " seconds"
  putStrLn $ "Days: " ++ show ((1704067200 - 1701907200) `div` 86400)
  
  -- Test 1 month ago - 45 days
  putStrLn "\n=== 1 month ago - 45 days ==="
  putStrLn $ "Expected: 1 month ago"
  putStrLn $ "Actual: " ++ timeago 1700179200 1704067200
  putStrLn $ "Difference: " ++ show (1704067200 - 1700179200) ++ " seconds"
  putStrLn $ "Months: " ++ show ((1704067200 - 1700179200) `div` 2592000)
  
  -- Test 10 months ago - 319 days
  putStrLn "\n=== 10 months ago - 319 days ==="
  putStrLn $ "Expected: 10 months ago"
  putStrLn $ "Actual: " ++ timeago 1676505600 1704067200
  putStrLn $ "Difference: " ++ show (1704067200 - 1676505600) ++ " seconds"
  putStrLn $ "Months: " ++ show ((1704067200 - 1676505600) `div` 2592000)
  
  -- Test error - just number
  putStrLn "\n=== error - just number ==="
  putStrLn $ "Expected: Nothing"
  putStrLn $ "Actual: " ++ show (parseDuration "42")
  
  -- Test same day different times
  putStrLn "\n=== same day different times ==="
  putStrLn $ "Expected: Date: 1705276800"
  putStrLn $ "Actual: " ++ dateRange 1705276800 1705320000