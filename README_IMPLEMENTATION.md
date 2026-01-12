# whenwords Idris2 Implementation

This directory contains an Idris2 implementation of the whenwords library following SPEC.md.

## Implementation Status

✅ **timeago**: Fully implemented and tested
⚠️ **duration**: Partially implemented (basic functionality working)
⚠️ **parseDuration**: Partially implemented (basic functionality working)
🚧 **humanDate**: Placeholder implementation
🚧 **dateRange**: Placeholder implementation

## Files Created

- `src/Whenwords.idr` - Main library implementation
- `src/TestRunner.idr` - Simple test runner
- `whenwords.ipkg` - Idris2 package configuration
- `usage.md` - Usage documentation

## Testing

Run the test runner:

```bash
cd src
/root/.idris2/bin/idris2 TestRunner.idr -o testrunner
./build/exec/testrunner
```

## Next Steps

To complete the implementation:

1. **Fix duration function**: Implement proper duration formatting with unit handling
2. **Fix parseDuration**: Implement proper parsing of duration strings
3. **Implement humanDate**: Add contextual date formatting
4. **Implement dateRange**: Add smart date range formatting
5. **Add comprehensive tests**: Parse tests.yaml and generate proper test cases

## Notes

The implementation uses Idris2's strong type system to ensure correctness. Error handling follows Idris2 idioms with `Maybe` types for parseDuration and simple string returns for other functions.