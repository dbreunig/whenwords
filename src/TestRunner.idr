||| Simple test runner for whenwords
module TestRunner

import Whenwords

%default total

main : IO ()
main = do
  putStrLn "Testing whenwords library..."
  
  -- Test timeago
  putStrLn "\n=== Testing timeago ==="
  putStrLn $ "just now: " ++ timeago 1704067200 1704067200
  putStrLn $ "1 minute ago: " ++ timeago 1704067155 1704067200
  putStrLn $ "2 minutes ago: " ++ timeago 1704067110 1704067200
  putStrLn $ "in 1 minute: " ++ timeago 1704067260 1704067200
  
  -- Test duration
  putStrLn "\n=== Testing duration ==="
  putStrLn $ "0 seconds: " ++ duration 0 defaultOptions
  putStrLn $ "45 seconds: " ++ duration 45 defaultOptions
  putStrLn $ "1 minute: " ++ duration 60 defaultOptions
  
  -- Test parseDuration
  putStrLn "\n=== Testing parseDuration ==="
  putStrLn $ "empty string: " ++ show (parseDuration "")
  putStrLn $ "valid string: " ++ show (parseDuration "test")
  
  -- Test humanDate
  putStrLn "\n=== Testing humanDate ==="
  putStrLn $ "today: " ++ humanDate 1705276800 1705276800
  
  -- Test dateRange
  putStrLn "\n=== Testing dateRange ==="
  putStrLn $ "same day: " ++ dateRange 1705276800 1705276800
  
  putStrLn "\nAll tests completed!"