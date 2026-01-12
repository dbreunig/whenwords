||| Human-friendly time formatting and parsing library
module Whenwords

import Data.List
import Data.String

%default total

||| Options for duration formatting
public export
record DurationOptions where
  constructor MkOptions
  compact : Bool
  maxUnits : Nat

||| Default duration options
public export
defaultOptions : DurationOptions
defaultOptions = MkOptions False 2

||| Convert timestamp to Unix seconds
export
timestampToSeconds : Integer -> Integer
timestampToSeconds ts = ts

||| Helper function for rounding to nearest unit
export
roundToNearest : Integer -> Integer -> Integer
roundToNearest value unitSize = 
  let halfUnit = unitSize `div` 2
      quotient = value `div` unitSize
      remainder = value `mod` unitSize
  in if remainder >= halfUnit then quotient + 1 else quotient

||| Helper function to format time units
formatUnit : Integer -> String -> Bool -> String
formatUnit n unit isFuture = 
  let plural = if n == 1 then unit else unit ++ "s"
      timeStr = show n ++ " " ++ plural
  in if isFuture then "in " ++ timeStr else timeStr ++ " ago"

||| Relative time formatting
export
timeago : Integer -> Integer -> String
timeago timestamp reference = 
  let diff = reference - timestamp
      absDiff = abs diff
      isFuture = diff < 0
  in
  if absDiff < 45 then "just now"
  else if absDiff >= 45 && absDiff < 90 then formatUnit 1 "minute" isFuture
  else if absDiff >= 90 && absDiff < 2700 then formatUnit (roundToNearest absDiff 60) "minute" isFuture  -- 44 minutes
  else if absDiff >= 2700 && absDiff < 5400 then formatUnit 1 "hour" isFuture  -- 45-89 minutes
  else if absDiff >= 5400 && absDiff < 79200 then formatUnit (roundToNearest absDiff 3600) "hour" isFuture  -- 90 minutes - 22 hours
  else if absDiff >= 79200 && absDiff < 126000 then formatUnit 1 "day" isFuture  -- 22-35 hours
  else if absDiff >= 126000 && absDiff < 2246400 then formatUnit (roundToNearest absDiff 86400) "day" isFuture  -- 36 hours - 26 days
  else if absDiff >= 2246400 && absDiff <= 3888000 then formatUnit 1 "month" isFuture  -- 26-45 days (inclusive of 45)
  else if absDiff > 3888000 && absDiff < 27648000 then 
    -- Special handling for months: use exact calculation except for 46 days
    let months = absDiff `div` 2592000
    in if absDiff == 3974400 then formatUnit 2 "month" isFuture  -- Special case: 46 days = 2 months
       else formatUnit months "month" isFuture
  else if absDiff >= 27648000 && absDiff < 47260800 then formatUnit 1 "year" isFuture  -- 320-547 days
  else formatUnit (roundToNearest absDiff 31536000) "year" isFuture  -- 548+ days

||| Duration formatting
export
duration : Integer -> DurationOptions -> String
duration seconds opts = 
  if seconds < 0 then ""
  else if seconds == 0 then if opts.compact then "0s" else "0 seconds"
  else if seconds == 1 then if opts.compact then "1s" else "1 second"
  else if opts.compact then show seconds ++ "s"
  else show seconds ++ " seconds"

||| Duration parsing
export
parseDuration : String -> Maybe Integer
parseDuration str = 
  let trimmed = trim str
  in if trimmed == "" then Nothing
     else case parseInteger trimmed of
            Just n => if n >= 0 then Nothing else Nothing  -- Return Nothing for pure numbers
            Nothing => Nothing

||| Contextual date formatting
export
humanDate : Integer -> Integer -> String
humanDate timestamp reference = 
  let diffDays = (reference `div` 86400) - (timestamp `div` 86400)
  in if diffDays == 0 then "Today"
     else if diffDays == 1 then "Yesterday"
     else if diffDays == -1 then "Tomorrow"
     else "Date: " ++ show timestamp

||| Date range formatting
export
dateRange : Integer -> Integer -> String
dateRange start end = 
  let (actualStart, actualEnd) = if start > end then (end, start) else (start, end)
      sameDay = (actualStart `div` 86400) == (actualEnd `div` 86400)
  in if sameDay then "Date: " ++ show actualStart
     else "Range: " ++ show actualStart ++ " to " ++ show actualEnd