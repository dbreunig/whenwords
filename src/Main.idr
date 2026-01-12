||| Main module for testing whenwords library
module Main

import TestWhenwords

main : IO ()
main = do
  putStrLn "whenwords library test runner"
  manualTests
  
  -- Run generated tests (placeholder)
  results <- runAllTests
  putStrLn $ "Test results: " ++ show (length results) ++ " tests run"