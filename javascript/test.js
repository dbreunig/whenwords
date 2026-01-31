const { timeago, duration, parseDuration, humanDate, dateRange } = require('./index');

let passed = 0;
let failed = 0;
const failures = [];

function assert(condition, message) {
  if (!condition) {
    failed++;
    failures.push(message);
  } else {
    passed++;
  }
}

function assertEquals(actual, expected, testName) {
  if (actual === expected) {
    passed++;
  } else {
    failed++;
    failures.push(`${testName}\n  Expected: ${expected}\n  Got: ${actual}`);
  }
}

function assertThrows(fn, testName) {
  try {
    fn();
    failed++;
    failures.push(`${testName}\n  Expected to throw but didn't`);
  } catch (e) {
    passed++;
  }
}

// timeago tests
assertEquals(timeago(1704067200, 1704067200), 'just now', 'timeago: just now - identical timestamps');
assertEquals(timeago(1704067170, 1704067200), 'just now', 'timeago: just now - 30 seconds ago');
assertEquals(timeago(1704067156, 1704067200), 'just now', 'timeago: just now - 44 seconds ago');
assertEquals(timeago(1704067155, 1704067200), '1 minute ago', 'timeago: 1 minute ago - 45 seconds');
assertEquals(timeago(1704067111, 1704067200), '1 minute ago', 'timeago: 1 minute ago - 89 seconds');
assertEquals(timeago(1704067110, 1704067200), '2 minutes ago', 'timeago: 2 minutes ago - 90 seconds');
assertEquals(timeago(1704065400, 1704067200), '30 minutes ago', 'timeago: 30 minutes ago');
assertEquals(timeago(1704064560, 1704067200), '44 minutes ago', 'timeago: 44 minutes ago');
assertEquals(timeago(1704064500, 1704067200), '1 hour ago', 'timeago: 1 hour ago - 45 minutes');
assertEquals(timeago(1704061860, 1704067200), '1 hour ago', 'timeago: 1 hour ago - 89 minutes');
assertEquals(timeago(1704061800, 1704067200), '2 hours ago', 'timeago: 2 hours ago - 90 minutes');
assertEquals(timeago(1704049200, 1704067200), '5 hours ago', 'timeago: 5 hours ago');
assertEquals(timeago(1703991600, 1704067200), '21 hours ago', 'timeago: 21 hours ago');
assertEquals(timeago(1703988000, 1704067200), '1 day ago', 'timeago: 1 day ago - 22 hours');
assertEquals(timeago(1703941200, 1704067200), '1 day ago', 'timeago: 1 day ago - 35 hours');
assertEquals(timeago(1703937600, 1704067200), '2 days ago', 'timeago: 2 days ago - 36 hours');
assertEquals(timeago(1703462400, 1704067200), '7 days ago', 'timeago: 7 days ago');
assertEquals(timeago(1701907200, 1704067200), '25 days ago', 'timeago: 25 days ago');
assertEquals(timeago(1701820800, 1704067200), '1 month ago', 'timeago: 1 month ago - 26 days');
assertEquals(timeago(1700179200, 1704067200), '1 month ago', 'timeago: 1 month ago - 45 days');
assertEquals(timeago(1700092800, 1704067200), '2 months ago', 'timeago: 2 months ago - 46 days');
assertEquals(timeago(1688169600, 1704067200), '6 months ago', 'timeago: 6 months ago');
assertEquals(timeago(1676505600, 1704067200), '11 months ago', 'timeago: 11 months ago - 319 days');
assertEquals(timeago(1676419200, 1704067200), '1 year ago', 'timeago: 1 year ago - 320 days');
assertEquals(timeago(1656806400, 1704067200), '1 year ago', 'timeago: 1 year ago - 547 days');
assertEquals(timeago(1656720000, 1704067200), '2 years ago', 'timeago: 2 years ago - 548 days');
assertEquals(timeago(1546300800, 1704067200), '5 years ago', 'timeago: 5 years ago');
assertEquals(timeago(1704067230, 1704067200), 'just now', 'timeago: future - in just now (30 seconds)');
assertEquals(timeago(1704067260, 1704067200), 'in 1 minute', 'timeago: future - in 1 minute');
assertEquals(timeago(1704067500, 1704067200), 'in 5 minutes', 'timeago: future - in 5 minutes');
assertEquals(timeago(1704070200, 1704067200), 'in 1 hour', 'timeago: future - in 1 hour');
assertEquals(timeago(1704078000, 1704067200), 'in 3 hours', 'timeago: future - in 3 hours');
assertEquals(timeago(1704150000, 1704067200), 'in 1 day', 'timeago: future - in 1 day');
assertEquals(timeago(1704240000, 1704067200), 'in 2 days', 'timeago: future - in 2 days');
assertEquals(timeago(1706745600, 1704067200), 'in 1 month', 'timeago: future - in 1 month');
assertEquals(timeago(1735689600, 1704067200), 'in 1 year', 'timeago: future - in 1 year');

// duration tests
assertEquals(duration(0), '0 seconds', 'duration: zero seconds');
assertEquals(duration(1), '1 second', 'duration: 1 second');
assertEquals(duration(45), '45 seconds', 'duration: 45 seconds');
assertEquals(duration(60), '1 minute', 'duration: 1 minute');
assertEquals(duration(90), '1 minute, 30 seconds', 'duration: 1 minute 30 seconds');
assertEquals(duration(120), '2 minutes', 'duration: 2 minutes');
assertEquals(duration(3600), '1 hour', 'duration: 1 hour');
assertEquals(duration(3661), '1 hour, 1 minute', 'duration: 1 hour 1 minute');
assertEquals(duration(5400), '1 hour, 30 minutes', 'duration: 1 hour 30 minutes');
assertEquals(duration(9000), '2 hours, 30 minutes', 'duration: 2 hours 30 minutes');
assertEquals(duration(86400), '1 day', 'duration: 1 day');
assertEquals(duration(93600), '1 day, 2 hours', 'duration: 1 day 2 hours');
assertEquals(duration(604800), '7 days', 'duration: 7 days');
assertEquals(duration(2592000), '1 month', 'duration: 1 month (30 days)');
assertEquals(duration(31536000), '1 year', 'duration: 1 year (365 days)');
assertEquals(duration(36720000), '1 year, 2 months', 'duration: 1 year 2 months');
assertEquals(duration(3661, { compact: true }), '1h 1m', 'duration: compact - 1h 1m');
assertEquals(duration(9000, { compact: true }), '2h 30m', 'duration: compact - 2h 30m');
assertEquals(duration(93600, { compact: true }), '1d 2h', 'duration: compact - 1d 2h');
assertEquals(duration(45, { compact: true }), '45s', 'duration: compact - 45s');
assertEquals(duration(0, { compact: true }), '0s', 'duration: compact - 0s');
assertEquals(duration(3661, { max_units: 1 }), '1 hour', 'duration: max_units 1 - hours only');
assertEquals(duration(93600, { max_units: 1 }), '1 day', 'duration: max_units 1 - days only');
assertEquals(duration(93661, { max_units: 3 }), '1 day, 2 hours, 1 minute', 'duration: max_units 3');
assertEquals(duration(9000, { compact: true, max_units: 1 }), '3h', 'duration: compact max_units 1');
assertThrows(() => duration(-100), 'duration: error - negative seconds');

// parseDuration tests
assertEquals(parseDuration('2h30m'), 9000, 'parseDuration: compact hours minutes');
assertEquals(parseDuration('2h 30m'), 9000, 'parseDuration: compact with space');
assertEquals(parseDuration('2h, 30m'), 9000, 'parseDuration: compact with comma');
assertEquals(parseDuration('2 hours 30 minutes'), 9000, 'parseDuration: verbose');
assertEquals(parseDuration('2 hours and 30 minutes'), 9000, 'parseDuration: verbose with and');
assertEquals(parseDuration('2 hours, and 30 minutes'), 9000, 'parseDuration: verbose with comma and');
assertEquals(parseDuration('2.5 hours'), 9000, 'parseDuration: decimal hours');
assertEquals(parseDuration('1.5h'), 5400, 'parseDuration: decimal compact');
assertEquals(parseDuration('90 minutes'), 5400, 'parseDuration: single unit minutes verbose');
assertEquals(parseDuration('90m'), 5400, 'parseDuration: single unit minutes compact');
assertEquals(parseDuration('90min'), 5400, 'parseDuration: single unit min');
assertEquals(parseDuration('2:30'), 9000, 'parseDuration: colon notation h:mm');
assertEquals(parseDuration('1:30:00'), 5400, 'parseDuration: colon notation h:mm:ss');
assertEquals(parseDuration('0:05:30'), 330, 'parseDuration: colon notation with seconds');
assertEquals(parseDuration('2 days'), 172800, 'parseDuration: days verbose');
assertEquals(parseDuration('2d'), 172800, 'parseDuration: days compact');
assertEquals(parseDuration('1 week'), 604800, 'parseDuration: weeks verbose');
assertEquals(parseDuration('1w'), 604800, 'parseDuration: weeks compact');
assertEquals(parseDuration('1 day, 2 hours, and 30 minutes'), 95400, 'parseDuration: mixed verbose');
assertEquals(parseDuration('1d 2h 30m'), 95400, 'parseDuration: mixed compact');
assertEquals(parseDuration('45 seconds'), 45, 'parseDuration: seconds only verbose');
assertEquals(parseDuration('45s'), 45, 'parseDuration: seconds compact s');
assertEquals(parseDuration('45sec'), 45, 'parseDuration: seconds compact sec');
assertEquals(parseDuration('2hr'), 7200, 'parseDuration: hours hr');
assertEquals(parseDuration('2hrs'), 7200, 'parseDuration: hours hrs');
assertEquals(parseDuration('30mins'), 1800, 'parseDuration: minutes mins');
assertEquals(parseDuration('2H 30M'), 9000, 'parseDuration: case insensitive');
assertEquals(parseDuration('  2 hours   30 minutes  '), 9000, 'parseDuration: whitespace tolerance');
assertThrows(() => parseDuration(''), 'parseDuration: error - empty string');
assertThrows(() => parseDuration('hello world'), 'parseDuration: error - no units');
assertThrows(() => parseDuration('-5 hours'), 'parseDuration: error - negative');
assertThrows(() => parseDuration('42'), 'parseDuration: error - just number');

// humanDate tests
assertEquals(humanDate(1705276800, 1705276800), 'Today', 'humanDate: today');
assertEquals(humanDate(1705320000, 1705276800), 'Today', 'humanDate: today - same day different time');
assertEquals(humanDate(1705190400, 1705276800), 'Yesterday', 'humanDate: yesterday');
assertEquals(humanDate(1705363200, 1705276800), 'Tomorrow', 'humanDate: tomorrow');
assertEquals(humanDate(1705190400, 1705276800), 'Yesterday', 'humanDate: last Sunday (1 day before Monday)');
assertEquals(humanDate(1705104000, 1705276800), 'Last Saturday', 'humanDate: last Saturday (2 days ago)');
assertEquals(humanDate(1705017600, 1705276800), 'Last Friday', 'humanDate: last Friday (3 days ago)');
assertEquals(humanDate(1704931200, 1705276800), 'Last Thursday', 'humanDate: last Thursday (4 days ago)');
assertEquals(humanDate(1704844800, 1705276800), 'Last Wednesday', 'humanDate: last Wednesday (5 days ago)');
assertEquals(humanDate(1704758400, 1705276800), 'Last Tuesday', 'humanDate: last Tuesday (6 days ago)');
assertEquals(humanDate(1704672000, 1705276800), 'January 8', 'humanDate: last Monday (7 days ago) - becomes date');
assertEquals(humanDate(1705363200, 1705276800), 'Tomorrow', 'humanDate: this Tuesday (1 day future)');
assertEquals(humanDate(1705449600, 1705276800), 'This Wednesday', 'humanDate: this Wednesday (2 days future)');
assertEquals(humanDate(1705536000, 1705276800), 'This Thursday', 'humanDate: this Thursday (3 days future)');
assertEquals(humanDate(1705795200, 1705276800), 'This Sunday', 'humanDate: this Sunday (6 days future)');
assertEquals(humanDate(1705881600, 1705276800), 'January 22', 'humanDate: next Monday (7 days future) - becomes date');
assertEquals(humanDate(1709251200, 1705276800), 'March 1', 'humanDate: same year different month');
assertEquals(humanDate(1735603200, 1705276800), 'December 31', 'humanDate: same year end of year');
assertEquals(humanDate(1672531200, 1705276800), 'January 1, 2023', 'humanDate: previous year');
assertEquals(humanDate(1736121600, 1705276800), 'January 6, 2025', 'humanDate: next year');

// dateRange tests
assertEquals(dateRange(1705276800, 1705276800), 'January 15, 2024', 'dateRange: same day');
assertEquals(dateRange(1705276800, 1705320000), 'January 15, 2024', 'dateRange: same day different times');
assertEquals(dateRange(1705276800, 1705363200), 'January 15–16, 2024', 'dateRange: consecutive days same month');
assertEquals(dateRange(1705276800, 1705881600), 'January 15–22, 2024', 'dateRange: same month range');
assertEquals(dateRange(1705276800, 1707955200), 'January 15 – February 15, 2024', 'dateRange: same year different months');
assertEquals(dateRange(1703721600, 1705276800), 'December 28, 2023 – January 15, 2024', 'dateRange: different years');
assertEquals(dateRange(1704067200, 1735603200), 'January 1 – December 31, 2024', 'dateRange: full year span');
assertEquals(dateRange(1705881600, 1705276800), 'January 15–22, 2024', 'dateRange: swapped inputs - should auto-correct');
assertEquals(dateRange(1672531200, 1735689600), 'January 1, 2023 – January 1, 2025', 'dateRange: multi-year span');

// Print results
console.log('\n' + '='.repeat(60));
console.log(`Tests passed: ${passed}`);
console.log(`Tests failed: ${failed}`);
console.log('='.repeat(60));

if (failures.length > 0) {
  console.log('\nFailures:');
  failures.forEach((failure, i) => {
    console.log(`\n${i + 1}. ${failure}`);
  });
}

process.exit(failed > 0 ? 1 : 0);
