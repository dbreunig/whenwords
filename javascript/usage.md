# whenwords for JavaScript

Human-friendly time formatting and parsing.

## Installation

Add `index.js` to your project and require it:

```javascript
const {
  timeago,
  duration,
  parseDuration,
  humanDate,
  dateRange,
} = require("./index");
```

## Quick start

```javascript
const now = Math.floor(Date.now() / 1000);
const yesterday = now - 86400;

// Format relative time
console.log(timeago(yesterday, now)); // "1 day ago"

// Format durations
console.log(duration(3661)); // "1 hour, 1 minute"
console.log(duration(3661, { compact: true })); // "1h 1m"

// Parse human-written durations
console.log(parseDuration("2h 30m")); // 9000

// Format contextual dates
console.log(humanDate(yesterday, now)); // "Yesterday"

// Format date ranges
console.log(dateRange(yesterday, now)); // "January 14–15, 2025"
```

## Functions

### timeago(timestamp, reference?) → string

Returns a human-readable relative time string.

**Parameters:**

- `timestamp` — Event timestamp (Unix seconds, ISO 8601 string, or Date object)
- `reference` — Current time for comparison (defaults to timestamp, so identical timestamps return "just now")

**Examples:**

```javascript
const now = 1704067200;
const past = 1704064500;

timeago(past, now); // "1 hour ago"
timeago(1704070200, now); // "in 1 hour"
```

### duration(seconds, options?) → string

Formats a duration (not relative to now).

**Parameters:**

- `seconds` — Duration in seconds (non-negative)
- `options` — Optional object:
  - `compact` (boolean) — Use "2h 34m" style instead of "2 hours, 34 minutes"
  - `max_units` (number) — Maximum units to display (default 2)

**Examples:**

```javascript
duration(3661); // "1 hour, 1 minute"
duration(3661, { compact: true }); // "1h 1m"
duration(3661, { max_units: 1 }); // "1 hour"
duration(9000, { compact: true, max_units: 1 }); // "3h"
```

### parseDuration(string) → number

Parses a human-written duration string into seconds.

**Parameters:**

- `string` — Duration string in various formats

**Accepts:**

- Compact: "2h30m", "2h 30m"
- Verbose: "2 hours 30 minutes", "2 hours and 30 minutes"
- Decimal: "2.5 hours", "1.5h"
- Colon notation: "2:30" (h:mm), "1:30:00" (h:mm:ss)
- Mixed: "1 day, 2 hours, and 30 minutes", "1d 2h 30m"

**Examples:**

```javascript
parseDuration("2h30m"); // 9000
parseDuration("2 hours 30 minutes"); // 9000
parseDuration("1:30:00"); // 5400
parseDuration("90 minutes"); // 5400
```

### humanDate(timestamp, reference?) → string

Returns a contextual date string.

**Parameters:**

- `timestamp` — Date to format (Unix seconds, ISO 8601 string, or Date)
- `reference` — Current date for comparison

**Examples:**

```javascript
const now = 1705276800; // Monday, 2024-01-15
const yesterday = 1705190400; // Sunday, 2024-01-14
const nextWeek = 1705881600; // Monday, 2024-01-22

humanDate(yesterday, now); // "Yesterday"
humanDate(now, now); // "Today"
humanDate(nextWeek, now); // "January 22"
```

### date_range(start, end) → string

Formats a date range with smart abbreviation.

**Parameters:**

- `start` — Start timestamp (Unix seconds, ISO 8601 string, or Date)
- `end` — End timestamp

**Examples:**

```javascript
dateRange(1705276800, 1705363200); // "January 15–16, 2024"
dateRange(1705276800, 1707955200); // "January 15 – February 15, 2024"
dateRange(1703721600, 1705276800); // "December 28, 2023 – January 15, 2024"
```

## Error handling

Functions throw `Error` with descriptive messages when given invalid input:

```javascript
try {
  parseDuration(""); // Empty string
} catch (e) {
  console.error(e.message); // "Empty string"
}

try {
  duration(-100); // Negative seconds
} catch (e) {
  console.error(e.message); // "Seconds cannot be negative"
}
```

## Accepted types

- **timestamp parameters:** Unix seconds (number), ISO 8601 string, or JavaScript `Date` object
- **seconds parameters:** Any non-negative number (integer or float)
- **string parameters:** UTF-8 text

## Timezone handling

- All timestamps are interpreted as UTC
- Relative functions (timeago, duration, parseDuration) ignore timezones
- Calendar functions (humanDate, date_range) display dates in UTC
