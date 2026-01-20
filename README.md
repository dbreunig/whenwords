# whenwords: An Open Source Library Without Code

Today I'm releasing [`whenwords`](https://github.com/dbreunig/whenwords), a relative time formatting library that contains _no code_.

`whenwords` delivers the following functions:

- **timeago** — Converts a timestamp to a relative time string like "3 hours ago" or "in 2 days" based on a reference time.
- **duration** — Formats a number of seconds as a human-readable duration like "2 hours, 30 minutes" or "2h 30m" in compact mode.
- **parse_duration** — The inverse of duration—parses strings like "2h 30m" or "2 hours and 30 minutes" into seconds.
- **human_date** — Returns contextual date strings like "Today", "Yesterday", "Last Tuesday", or "March 5" depending on how far the date is from a reference point.
- **date_range** — Formats a start and end timestamp as a smart date range, collapsing redundant information: "March 5–7, 2024" instead of "March 5, 2024 – March 7, 2024".

There are _many_ libraries that perform similar functions. But none of them are language agnostic.

`whenwords` supports Ruby, Python, Rust, Elixir, Swift, PHP, and Bash. I'm sure it works in other languages, too. [Those are just the languages I've tried and tested](https://github.com/dbreunig/whenwords-examples).

(I even implemented it as Excel formulas. Though that one requires a bit of work to install.)

But like I said: the `whenwords` library _contains no code_. Instead, `whenwords` contains specs and tests, specifically:

- **SPEC.md**: A detailed description of how the library should behave and how it should be implemented.
- **tests.yaml**: A list of language-agnostic test cases, defined as input/output pairs, that any implementation must pass.
- **INSTALL.md**: Instructions for building `whenwords`, for you, the human.

The installation instructions are comically simple, just a prompt to paste into Claude, Codex, Cursor, whatever. It's short enough to print here in its entirety:

``` markdown
Implement the whenwords library in [LANGUAGE].

1. Read SPEC.md for complete behavior specification
2. Parse tests.yaml and generate a test file
3. Implement all five functions: timeago, duration, parse_duration, 
   human_date, date_range
4. Run tests until all pass
5. Place implementation in [LOCATION]

All tests.yaml test cases must pass. See SPEC.md "Testing" section 
for test generation examples.
```

Pick your language, pick your location, copy, paste, and go.

[I've written about `whenwords` here](https://www.dbreunig.com/2026/01/08/a-software-library-with-no-code.html).
