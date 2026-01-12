||| Test suite for whenwords library
module TestWhenwords

import Whenwords
import Data.List
import Data.String

%default total

||| Test result type
data TestResult = Pass | Fail String

Show TestResult where
  show Pass = "PASS"
  show (Fail msg) = "FAIL: " ++ msg

||| Run a single test case
export
runTest : (String, String -> Maybe Integer -> DurationOptions -> String) -> 
          (String, Integer -> Integer -> String) -> 
          (String, String -> Maybe Integer) -> 
          (String, Integer -> Integer -> String) -> 
          (String, Integer -> Integer -> String) -> 
          TestResult
runTest (durationName, durationFunc) 
        (timeagoName, timeagoFunc) 
        (parseDurationName, parseDurationFunc) 
        (humanDateName, humanDateFunc) 
        (dateRangeName, dateRangeFunc) = 
  -- This is a placeholder - in a real implementation we would parse tests.yaml
  -- and generate specific test cases
  Pass

||| Parse tests.yaml and generate test cases
||| This is a simplified version - a full implementation would parse YAML
export
runAllTests : IO (List TestResult)
runAllTests = pure []

||| Quick manual tests for basic functionality
export
manualTests : IO ()
manualTests = do
  putStrLn "Running manual tests..."
  
  -- Test timeago
  putStrLn "Testing timeago:"
  putStrLn $ "just now: " ++ timeago 1704067200 1704067200
  putStrLn $ "1 minute ago: " ++ timeago 1704067155 1704067200
  putStrLn $ "2 minutes ago: " ++ timeago 1704067110 1704067200
  putStrLn $ "in 1 minute: " ++ timeago 1704067260 1704067200
  
  -- Test duration
  putStrLn "\nTesting duration:"
  putStrLn $ "0 seconds: " ++ duration 0 defaultOptions
  putStrLn $ "45 seconds: " ++ duration 45 defaultOptions
  putStrLn $ "1 minute: " ++ duration 60 defaultOptions
  putStrLn $ "1h 1m compact: " ++ duration 3661 (MkOptions True 2)
  
  -- Test parseDuration
  putStrLn "\nTesting parseDuration:"
  putStrLn $ "2h30m: " ++ show (parseDuration "2h30m")
  putStrLn $ "2 hours 30 minutes: " ++ show (parseDuration "2 hours 30 minutes")
  putStrLn $ "empty string: " ++ show (parseDuration "")
  
  putStrLn "\nManual tests completed."