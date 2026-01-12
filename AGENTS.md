# AGENTS.md - whenwords Ghost Library

This repository contains a **ghost library** - a library distributed as specifications and tests rather than code. Agents implement the library in target programming languages.

## Repository Overview

**whenwords** is a human-friendly time formatting library with five functions:
- `timeago` - Relative time strings like "3 hours ago"
- `duration` - Format seconds as human-readable durations
- `parse_duration` - Parse duration strings into seconds
- `human_date` - Contextual date strings like "Today", "Yesterday"
- `date_range` - Smart date range formatting

## Implementation Workflow

### 1. Read the Specification
- **SPEC.md**: Complete behavior specification with edge cases, error handling, and design principles
- Key principles: Pure functions only, Unix timestamps, deterministic behavior

### 2. Parse Test Cases
- **tests.yaml**: Contains 125 language-agnostic test cases
- Tests are input/output pairs that must pass exactly
- Functions: timeago (36), duration (26), parse_duration (33), human_date (21), date_range (9)

### 3. Generate Implementation

**Required Files:**
- Library source file(s) with all five functions
- Test file(s) that parse and run tests.yaml cases
- usage.md documentation

**Implementation Checklist:**
- [ ] All five functions implemented
- [ ] All tests.yaml tests pass
- [ ] Functions accept language-native datetime types
- [ ] Errors handled idiomatically for target language
- [ ] Pluralization correct ("1 minute" vs "2 minutes")
- [ ] Future times return "in X" not "X ago"
- [ ] Zero duration returns "0 seconds"
- [ ] Code is idiomatic for target language
- [ ] usage.md generated with function signatures and examples

### 4. Test Generation Pattern

For each test case in tests.yaml:

```yaml
timeago:
  - name: "2 minutes ago - 90 seconds"
    input: { timestamp: 1704067110, reference: 1704067200 }
    output: "2 minutes ago"
```

Generate test code that:
- Calls function with `input` arguments
- Asserts return value equals `output`
- For `error: true` cases, asserts function raises/returns error

## Language-Specific Guidelines

### Error Handling Patterns
- **Python**: Raise `ValueError` with descriptive message
- **TypeScript**: Throw `Error` or return `null` (document which)
- **Rust**: Return `Result<T, ParseError>`
- **Go**: Return `(value, error)` tuple
- **Java**: Throw `IllegalArgumentException`

### Type Conventions
- `timestamp`: Unix seconds OR ISO 8601 string OR language-native datetime
- `number`: Integer or float as appropriate
- `string`: UTF-8 text
- `options`: Language-idiomatic options object

### Package Structure
**Do generate:**
- Library source file(s)
- Test file(s)
- usage.md

**Do not generate:**
- Package distribution scaffolding (setup.py, pyproject.toml with publish metadata, etc.)
- CI/CD configuration
- Repository-specific module paths

## Key Implementation Details

### Timezone Handling
- Relative functions (`timeago`, `duration`, `parse_duration`): Timezones don't matter
- Calendar functions (`human_date`, `date_range`): Assume UTC by default

### Rounding and Boundaries
- Use half-up rounding (2.5 → 3, 2.4 → 2)
- Thresholds use `>=` on lower bound
- Pluralization: 1 = singular, 0/2+ = plural

### Duration Formatting
- Units: years (365d), months (30d), days, hours, minutes, seconds
- Only show non-zero units
- Round smallest displayed unit
- Compact mode: "2h 30m" instead of "2 hours, 30 minutes"

## Quick Start Prompt

Use this prompt template for implementation:

```
Implement the whenwords library in [LANGUAGE].

1. Read SPEC.md for complete behavior specification
2. Parse tests.yaml and generate a test file
3. Implement all five functions: timeago, duration, parse_duration, human_date, date_range
4. Run tests until all pass
5. Place implementation in [LOCATION]

All tests.yaml test cases must pass. See SPEC.md "Testing" section for test generation examples.
```

## Verification

After implementation:
- Run the test suite - all 125 tests must pass
- Verify functions accept multiple timestamp formats
- Check error handling for invalid inputs
- Ensure usage.md is complete and accurate

The specification is the single source of truth - implementations must match SPEC.md behavior exactly.

## Development Environment

### Available Tools

**Idris2 Compiler Tools:**
- System compiler: `/root/.idris2/bin/idris2 --check --log 50 Sample.idr`
- Check hole context (for `?hole` in code): 
  ```bash
  echo -e ':color off\n :load "Sample.idr"\n :ti hole' | /root/.idris2/bin/idris2
  ```
- Check type declarations (for top-level functions/data):
  ```bash
  echo -e ':color off\n :load "Sample.idr"\n :di some_function' | /root/.idris2/bin/idris2
  ```

### Language Support

This repository supports implementation in any programming language. The Idris2 tools are available for agents implementing the library in Idris2 specifically.

For other languages, use standard language toolchains:
- **Python**: `python`, `pytest`
- **TypeScript**: `tsc`, `jest` or `node`
- **Rust**: `cargo`, `rustc`
- **Go**: `go`, `go test`
- **Java**: `javac`, `java`

### Testing Commands

Use language-appropriate test runners:
- Python: `python -m pytest`
- TypeScript: `npm test` or `npx jest`
- Rust: `cargo test`
- Go: `go test ./...`
- Java: `mvn test` or `gradle test`