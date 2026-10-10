# Building whenwords

whenwords is a **ghost library**—distributed as a specification, not code. To use it, ask a coding agent to implement it in your language.

## Quick start

Give your coding agent this prompt:

```
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

## What the agent will do

1. **Read SPEC.md** — Understand behavior, edge cases, error handling
2. **Parse tests.yaml** — Load test cases (100+ total across all functions)
3. **Generate tests** — Create test file in target language's test framework
4. **Implement functions** — Write the library code
5. **Run and iterate** — Fix failures until all tests pass

## Files

| File | Purpose |
|------|---------|
| SPEC.md | Complete behavior specification |
| tests.yaml | Language-agnostic test cases |

## Verification

After generation, run the test suite. All tests must pass:

- 36 timeago tests
- 26 duration tests
- 32 parse_duration tests
- 20 human_date tests
- 9 date_range tests

Total: 123 test cases.

## Why this works

Traditional libraries ship code. You trust the maintainer, manage versions, handle dependency conflicts.

Ghost libraries ship specifications. Your agent generates the implementation locally. You can audit every line. No supply chain. No version conflicts. The spec is the single source of truth.

For small utilities like this one, the specification is more valuable than any particular implementation.