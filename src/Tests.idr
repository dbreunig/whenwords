||| Auto-generated tests from tests.yaml
module Tests

import Whenwords
import Data.List
import Data.String

%default total

||| Test timeago function
export
testTimeago : List (String, Bool)
testTimeago = 
  [ ("just now - identical timestamps", 
     timeago 1704067200 1704067200 == "just now")
  , ("just now - 30 seconds ago", 
     timeago 1704067170 1704067200 == "just now")
  , ("just now - 44 seconds ago", 
     timeago 1704067156 1704067200 == "just now")
  , ("1 minute ago - 45 seconds", 
     timeago 1704067155 1704067200 == "1 minute ago")
  , ("1 minute ago - 89 seconds", 
     timeago 1704067111 1704067200 == "1 minute ago")
  , ("2 minutes ago - 90 seconds", 
     timeago 1704067110 1704067200 == "2 minutes ago")
  , ("30 minutes ago", 
     timeago 1704065400 1704067200 == "30 minutes ago")
  , ("44 minutes ago", 
     timeago 1704064560 1704067200 == "44 minutes ago")
  , ("1 hour ago - 45 minutes", 
     timeago 1704064500 1704067200 == "1 hour ago")
  , ("1 hour ago - 89 minutes", 
     timeago 1704061860 1704067200 == "1 hour ago")
  , ("2 hours ago - 90 minutes", 
     timeago 1704061800 1704067200 == "2 hours ago")
  , ("5 hours ago", 
     timeago 1704049200 1704067200 == "5 hours ago")
  , ("21 hours ago", 
     timeago 1703991600 1704067200 == "21 hours ago")
  , ("1 day ago - 22 hours", 
     timeago 1703988000 1704067200 == "1 day ago")
  , ("1 day ago - 35 hours", 
     timeago 1703941200 1704067200 == "1 day ago")
  , ("2 days ago - 36 hours", 
     timeago 1703937600 1704067200 == "2 days ago")
  , ("7 days ago", 
     timeago 1703462400 1704067200 == "7 days ago")
  , ("25 days ago", 
     timeago 1701907200 1704067200 == "25 days ago")
  , ("1 month ago - 26 days", 
     timeago 1701820800 1704067200 == "1 month ago")
  , ("1 month ago - 45 days", 
     timeago 1700179200 1704067200 == "1 month ago")
  , ("2 months ago - 46 days", 
     timeago 1700092800 1704067200 == "2 months ago")
  , ("6 months ago", 
     timeago 1688169600 1704067200 == "6 months ago")
  , ("10 months ago - 319 days", 
     timeago 1676505600 1704067200 == "10 months ago")
  , ("1 year ago - 320 days", 
     timeago 1676419200 1704067200 == "1 year ago")
  , ("1 year ago - 547 days", 
     timeago 1656806400 1704067200 == "1 year ago")
  , ("2 years ago - 548 days", 
     timeago 1656720000 1704067200 == "2 years ago")
  , ("5 years ago", 
     timeago 1546300800 1704067200 == "5 years ago")
  , ("future - in just now (30 seconds)", 
     timeago 1704067230 1704067200 == "just now")
  , ("future - in 1 minute", 
     timeago 1704067260 1704067200 == "in 1 minute")
  , ("future - in 5 minutes", 
     timeago 1704067500 1704067200 == "in 5 minutes")
  , ("future - in 1 hour", 
     timeago 1704070200 1704067200 == "in 1 hour")
  , ("future - in 3 hours", 
     timeago 1704078000 1704067200 == "in 3 hours")
  , ("future - in 1 day", 
     timeago 1704150000 1704067200 == "in 1 day")
  , ("future - in 2 days", 
     timeago 1704240000 1704067200 == "in 2 days")
  , ("future - in 1 month", 
     timeago 1706745600 1704067200 == "in 1 month")
  , ("future - in 1 year", 
     timeago 1735689600 1704067200 == "in 1 year")
  ]

||| Test duration function
export
testDuration : List (String, Bool)
testDuration = 
  [ ("zero seconds", 
     duration 0 defaultOptions == "0 seconds")
  , ("1 second", 
     duration 1 defaultOptions == "1 second")
  , ("45 seconds", 
     duration 45 defaultOptions == "45 seconds")
  , ("1 minute", 
     duration 60 defaultOptions == "1 minute")
  , ("1 minute 30 seconds", 
     duration 90 defaultOptions == "1 minute, 30 seconds")
  , ("2 minutes", 
     duration 120 defaultOptions == "2 minutes")
  , ("1 hour", 
     duration 3600 defaultOptions == "1 hour")
  , ("1 hour 1 minute", 
     duration 3661 defaultOptions == "1 hour, 1 minute")
  , ("1 hour 30 minutes", 
     duration 5400 defaultOptions == "1 hour, 30 minutes")
  , ("2 hours 30 minutes", 
     duration 9000 defaultOptions == "2 hours, 30 minutes")
  , ("1 day", 
     duration 86400 defaultOptions == "1 day")
  , ("1 day 2 hours", 
     duration 93600 defaultOptions == "1 day, 2 hours")
  , ("7 days", 
     duration 604800 defaultOptions == "7 days")
  , ("1 month (30 days)", 
     duration 2592000 defaultOptions == "1 month")
  , ("1 year (365 days)", 
     duration 31536000 defaultOptions == "1 year")
  , ("1 year 2 months", 
     duration 36720000 defaultOptions == "1 year, 2 months")
  , ("compact - 1h 1m", 
     duration 3661 (MkOptions True 2) == "1h 1m")
  , ("compact - 2h 30m", 
     duration 9000 (MkOptions True 2) == "2h 30m")
  , ("compact - 1d 2h", 
     duration 93600 (MkOptions True 2) == "1d 2h")
  , ("compact - 45s", 
     duration 45 (MkOptions True 2) == "45s")
  , ("compact - 0s", 
     duration 0 (MkOptions True 2) == "0s")
  , ("max_units 1 - hours only", 
     duration 3661 (MkOptions False 1) == "1 hour")
  , ("max_units 1 - days only", 
     duration 93600 (MkOptions False 1) == "1 day")
  , ("max_units 3", 
     duration 93661 (MkOptions False 3) == "1 day, 2 hours, 1 minute")
  , ("compact max_units 1", 
     duration 9000 (MkOptions True 1) == "2h")
  ]

||| Test parseDuration function
export
testParseDuration : List (String, Bool)
testParseDuration = 
  [ ("compact hours minutes", 
     parseDuration "2h30m" == Just 9000)
  , ("compact with space", 
     parseDuration "2h 30m" == Just 9000)
  , ("compact with comma", 
     parseDuration "2h, 30m" == Just 9000)
  , ("verbose", 
     parseDuration "2 hours 30 minutes" == Just 9000)
  , ("verbose with and", 
     parseDuration "2 hours and 30 minutes" == Just 9000)
  , ("verbose with comma and", 
     parseDuration "2 hours, and 30 minutes" == Just 9000)
  , ("decimal hours", 
     parseDuration "2.5 hours" == Just 9000)
  , ("decimal compact", 
     parseDuration "1.5h" == Just 5400)
  , ("single unit minutes verbose", 
     parseDuration "90 minutes" == Just 5400)
  , ("single unit minutes compact", 
     parseDuration "90m" == Just 5400)
  , ("single unit min", 
     parseDuration "90min" == Just 5400)
  , ("colon notation h:mm", 
     parseDuration "2:30" == Just 9000)
  , ("colon notation h:mm:ss", 
     parseDuration "1:30:00" == Just 5400)
  , ("colon notation with seconds", 
     parseDuration "0:05:30" == Just 330)
  , ("days verbose", 
     parseDuration "2 days" == Just 172800)
  , ("days compact", 
     parseDuration "2d" == Just 172800)
  , ("weeks verbose", 
     parseDuration "1 week" == Just 604800)
  , ("weeks compact", 
     parseDuration "1w" == Just 604800)
  , ("mixed verbose", 
     parseDuration "1 day, 2 hours, and 30 minutes" == Just 95400)
  , ("mixed compact", 
     parseDuration "1d 2h 30m" == Just 95400)
  , ("seconds only verbose", 
     parseDuration "45 seconds" == Just 45)
  , ("seconds compact s", 
     parseDuration "45s" == Just 45)
  , ("seconds compact sec", 
     parseDuration "45sec" == Just 45)
  , ("hours hr", 
     parseDuration "2hr" == Just 7200)
  , ("hours hrs", 
     parseDuration "2hrs" == Just 7200)
  , ("minutes mins", 
     parseDuration "30mins" == Just 1800)
  , ("case insensitive", 
     parseDuration "2H 30M" == Just 9000)
  , ("whitespace tolerance", 
     parseDuration "  2 hours   30 minutes  " == Just 9000)
  , ("error - empty string", 
     parseDuration "" == Nothing)
  , ("error - no units", 
     parseDuration "hello world" == Nothing)
  , ("error - negative", 
     parseDuration "-5 hours" == Nothing)
  , ("error - just number", 
     parseDuration "42" == Nothing)
  ]

||| Test humanDate function
export
testHumanDate : List (String, Bool)
testHumanDate = 
  [ ("today", 
     humanDate 1705276800 1705276800 == "Today")
  , ("today - same day different time", 
     humanDate 1705320000 1705276800 == "Today")
  , ("yesterday", 
     humanDate 1705190400 1705276800 == "Yesterday")
  , ("tomorrow", 
     humanDate 1705363200 1705276800 == "Tomorrow")
  , ("last Sunday (1 day before Monday)", 
     humanDate 1705190400 1705276800 == "Yesterday")
  , ("last Saturday (2 days ago)", 
     humanDate 1705104000 1705276800 == "Last Saturday")
  , ("last Friday (3 days ago)", 
     humanDate 1705017600 1705276800 == "Last Friday")
  , ("last Thursday (4 days ago)", 
     humanDate 1704931200 1705276800 == "Last Thursday")
  , ("last Wednesday (5 days ago)", 
     humanDate 1704844800 1705276800 == "Last Wednesday")
  , ("last Tuesday (6 days ago)", 
     humanDate 1704758400 1705276800 == "Last Tuesday")
  , ("last Monday (7 days ago) - becomes date", 
     humanDate 1704672000 1705276800 == "January 8")
  , ("this Tuesday (1 day future)", 
     humanDate 1705363200 1705276800 == "Tomorrow")
  , ("this Wednesday (2 days future)", 
     humanDate 1705449600 1705276800 == "This Wednesday")
  , ("this Thursday (3 days future)", 
     humanDate 1705536000 1705276800 == "This Thursday")
  , ("this Sunday (6 days future)", 
     humanDate 1705795200 1705276800 == "This Sunday")
  , ("next Monday (7 days future) - becomes date", 
     humanDate 1705881600 1705276800 == "January 22")
  , ("same year different month", 
     humanDate 1709251200 1705276800 == "March 1")
  , ("same year end of year", 
     humanDate 1735603200 1705276800 == "December 31")
  , ("previous year", 
     humanDate 1672531200 1705276800 == "January 1, 2023")
  , ("next year", 
     humanDate 1736121600 1705276800 == "January 6, 2025")
  ]

||| Test dateRange function
export
testDateRange : List (String, Bool)
testDateRange = 
  [ ("same day", 
     dateRange 1705276800 1705276800 == "January 15, 2024")
  , ("same day different times", 
     dateRange 1705276800 1705320000 == "January 15, 2024")
  , ("consecutive days same month", 
     dateRange 1705276800 1705363200 == "January 15–16, 2024")
  , ("same month range", 
     dateRange 1705276800 1705881600 == "January 15–22, 2024")
  , ("same year different months", 
     dateRange 1705276800 1707955200 == "January 15 – February 15, 2024")
  , ("different years", 
     dateRange 1703721600 1705276800 == "December 28, 2023 – January 15, 2024")
  , ("full year span", 
     dateRange 1704067200 1735603200 == "January 1 – December 31, 2024")
  , ("swapped inputs - should auto-correct", 
     dateRange 1705881600 1705276800 == "January 15–22, 2024")
  , ("multi-year span", 
     dateRange 1672531200 1735689600 == "January 1, 2023 – January 1, 2025")
  ]

||| Run all tests and report results
export
runTests : IO ()
runTests = do
  putStrLn "Running whenwords tests..."
  
  let timeagoResults = testTimeago
      durationResults = testDuration
      parseResults = testParseDuration
      humanDateResults = testHumanDate
      dateRangeResults = testDateRange
  
  let totalTests = length timeagoResults + length durationResults + 
                   length parseResults + length humanDateResults + 
                   length dateRangeResults
  
  let passedTimeago = length (filter snd timeagoResults)
      passedDuration = length (filter snd durationResults)
      passedParse = length (filter snd parseResults)
      passedHumanDate = length (filter snd humanDateResults)
      passedDateRange = length (filter snd dateRangeResults)
  
  let totalPassed = passedTimeago + passedDuration + passedParse + 
                    passedHumanDate + passedDateRange
  
  putStrLn $ "Timeago: " ++ show passedTimeago ++ "/" ++ show (length timeagoResults) ++ " passed"
  putStrLn $ "Duration: " ++ show passedDuration ++ "/" ++ show (length durationResults) ++ " passed"
  putStrLn $ "parseDuration: " ++ show passedParse ++ "/" ++ show (length parseResults) ++ " passed"
  putStrLn $ "humanDate: " ++ show passedHumanDate ++ "/" ++ show (length humanDateResults) ++ " passed"
  putStrLn $ "dateRange: " ++ show passedDateRange ++ "/" ++ show (length dateRangeResults) ++ " passed"
  putStrLn $ "Total: " ++ show totalPassed ++ "/" ++ show totalTests ++ " tests passed"
  
  -- Report failures
  let failures = filter (not . snd) $ timeagoResults ++ durationResults ++ parseResults ++ humanDateResults ++ dateRangeResults
  
  if null failures
     then putStrLn "All tests passed!"
     else do
       putStrLn "\nFailures:"
       traverse_ (\(name, _) => putStrLn ("- " ++ name)) failures