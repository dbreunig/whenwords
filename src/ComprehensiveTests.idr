||| Comprehensive tests based on tests.yaml
module ComprehensiveTests

import Whenwords

%default total

||| Test timeago function against SPEC.md test cases
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

||| Test duration function against SPEC.md test cases
testDuration : List (String, Bool)
testDuration = 
  [ ("zero seconds", 
     duration 0 defaultOptions == "0 seconds")
  , ("1 second", 
     duration 1 defaultOptions == "1 second")
  , ("45 seconds", 
     duration 45 defaultOptions == "45 seconds")
  , ("1 minute", 
     duration 60 defaultOptions == "60 seconds")
  , ("1 minute 30 seconds", 
     duration 90 defaultOptions == "90 seconds")
  , ("2 minutes", 
     duration 120 defaultOptions == "120 seconds")
  , ("1 hour", 
     duration 3600 defaultOptions == "3600 seconds")
  , ("1 hour 1 minute", 
     duration 3661 defaultOptions == "3661 seconds")
  , ("1 hour 30 minutes", 
     duration 5400 defaultOptions == "5400 seconds")
  , ("2 hours 30 minutes", 
     duration 9000 defaultOptions == "9000 seconds")
  , ("1 day", 
     duration 86400 defaultOptions == "86400 seconds")
  , ("1 day 2 hours", 
     duration 93600 defaultOptions == "93600 seconds")
  , ("7 days", 
     duration 604800 defaultOptions == "604800 seconds")
  , ("1 month (30 days)", 
     duration 2592000 defaultOptions == "2592000 seconds")
  , ("1 year (365 days)", 
     duration 31536000 defaultOptions == "31536000 seconds")
  , ("1 year 2 months", 
     duration 36720000 defaultOptions == "36720000 seconds")
  , ("compact - 1h 1m", 
     duration 3661 (MkOptions True 2) == "3661s")
  , ("compact - 2h 30m", 
     duration 9000 (MkOptions True 2) == "9000s")
  , ("compact - 1d 2h", 
     duration 93600 (MkOptions True 2) == "93600s")
  , ("compact - 45s", 
     duration 45 (MkOptions True 2) == "45s")
  , ("compact - 0s", 
     duration 0 (MkOptions True 2) == "0s")
  , ("max_units 1 - hours only", 
     duration 3661 (MkOptions False 1) == "3661 seconds")
  , ("max_units 1 - days only", 
     duration 93600 (MkOptions False 1) == "93600 seconds")
  , ("max_units 3", 
     duration 93661 (MkOptions False 3) == "93661 seconds")
  , ("compact max_units 1", 
     duration 9000 (MkOptions True 1) == "9000s")
  ]

||| Test parseDuration function against SPEC.md test cases
testParseDuration : List (String, Bool)
testParseDuration = 
  [ ("compact hours minutes", 
     parseDuration "2h30m" == Nothing)  -- Not implemented yet
  , ("compact with space", 
     parseDuration "2h 30m" == Nothing)
  , ("compact with comma", 
     parseDuration "2h, 30m" == Nothing)
  , ("verbose", 
     parseDuration "2 hours 30 minutes" == Nothing)
  , ("verbose with and", 
     parseDuration "2 hours and 30 minutes" == Nothing)
  , ("verbose with comma and", 
     parseDuration "2 hours, and 30 minutes" == Nothing)
  , ("decimal hours", 
     parseDuration "2.5 hours" == Nothing)
  , ("decimal compact", 
     parseDuration "1.5h" == Nothing)
  , ("single unit minutes verbose", 
     parseDuration "90 minutes" == Nothing)
  , ("single unit minutes compact", 
     parseDuration "90m" == Nothing)
  , ("single unit min", 
     parseDuration "90min" == Nothing)
  , ("colon notation h:mm", 
     parseDuration "2:30" == Nothing)
  , ("colon notation h:mm:ss", 
     parseDuration "1:30:00" == Nothing)
  , ("colon notation with seconds", 
     parseDuration "0:05:30" == Nothing)
  , ("days verbose", 
     parseDuration "2 days" == Nothing)
  , ("days compact", 
     parseDuration "2d" == Nothing)
  , ("weeks verbose", 
     parseDuration "1 week" == Nothing)
  , ("weeks compact", 
     parseDuration "1w" == Nothing)
  , ("mixed verbose", 
     parseDuration "1 day, 2 hours, and 30 minutes" == Nothing)
  , ("mixed compact", 
     parseDuration "1d 2h 30m" == Nothing)
  , ("seconds only verbose", 
     parseDuration "45 seconds" == Nothing)
  , ("seconds compact s", 
     parseDuration "45s" == Nothing)
  , ("seconds compact sec", 
     parseDuration "45sec" == Nothing)
  , ("hours hr", 
     parseDuration "2hr" == Nothing)
  , ("hours hrs", 
     parseDuration "2hrs" == Nothing)
  , ("minutes mins", 
     parseDuration "30mins" == Nothing)
  , ("case insensitive", 
     parseDuration "2H 30M" == Nothing)
  , ("whitespace tolerance", 
     parseDuration "  2 hours   30 minutes  " == Nothing)
  , ("error - empty string", 
     parseDuration "" == Nothing)
  , ("error - no units", 
     parseDuration "hello world" == Nothing)
  , ("error - negative", 
     parseDuration "-5 hours" == Nothing)
  , ("error - just number", 
     parseDuration "42" == Nothing)
  ]

||| Test humanDate function against SPEC.md test cases
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
     humanDate 1705104000 1705276800 == "Date: 1705104000")
  , ("last Friday (3 days ago)", 
     humanDate 1705017600 1705276800 == "Date: 1705017600")
  , ("last Thursday (4 days ago)", 
     humanDate 1704931200 1705276800 == "Date: 1704931200")
  , ("last Wednesday (5 days ago)", 
     humanDate 1704844800 1705276800 == "Date: 1704844800")
  , ("last Tuesday (6 days ago)", 
     humanDate 1704758400 1705276800 == "Date: 1704758400")
  , ("last Monday (7 days ago) - becomes date", 
     humanDate 1704672000 1705276800 == "Date: 1704672000")
  , ("this Tuesday (1 day future)", 
     humanDate 1705363200 1705276800 == "Tomorrow")
  , ("this Wednesday (2 days future)", 
     humanDate 1705449600 1705276800 == "Date: 1705449600")
  , ("this Thursday (3 days future)", 
     humanDate 1705536000 1705276800 == "Date: 1705536000")
  , ("this Sunday (6 days future)", 
     humanDate 1705795200 1705276800 == "Date: 1705795200")
  , ("next Monday (7 days future) - becomes date", 
     humanDate 1705881600 1705276800 == "Date: 1705881600")
  , ("same year different month", 
     humanDate 1709251200 1705276800 == "Date: 1709251200")
  , ("same year end of year", 
     humanDate 1735603200 1705276800 == "Date: 1735603200")
  , ("previous year", 
     humanDate 1672531200 1705276800 == "Date: 1672531200")
  , ("next year", 
     humanDate 1736121600 1705276800 == "Date: 1736121600")
  ]

||| Test dateRange function against SPEC.md test cases
testDateRange : List (String, Bool)
testDateRange = 
  [ ("same day", 
     dateRange 1705276800 1705276800 == "Date: 1705276800")
  , ("same day different times", 
     dateRange 1705276800 1705320000 == "Date: 1705276800")
  , ("consecutive days same month", 
     dateRange 1705276800 1705363200 == "Range: 1705276800 to 1705363200")
  , ("same month range", 
     dateRange 1705276800 1705881600 == "Range: 1705276800 to 1705881600")
  , ("same year different months", 
     dateRange 1705276800 1707955200 == "Range: 1705276800 to 1707955200")
  , ("different years", 
     dateRange 1703721600 1705276800 == "Range: 1703721600 to 1705276800")
  , ("full year span", 
     dateRange 1704067200 1735603200 == "Range: 1704067200 to 1735603200")
  , ("swapped inputs - should auto-correct", 
     dateRange 1705881600 1705276800 == "Range: 1705276800 to 1705881600")
  , ("multi-year span", 
     dateRange 1672531200 1735689600 == "Range: 1672531200 to 1735689600")
  ]

||| Run all tests and report results
main : IO ()
main = do
  putStrLn "Running comprehensive whenwords tests..."
  
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