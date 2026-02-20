---
name: test-patterns
description: Use when writing tests, organizing test suites, creating mocks/fixtures, or establishing testing conventions for a project.
---

# Test Patterns

Industry best practices for writing maintainable, reliable tests.

## When to Use

- Setting up test structure for a project
- Writing new test suites
- Refactoring flaky or brittle tests
- Creating mocks, stubs, or fixtures
- Reviewing test code quality

---

## Core Principles

### FIRST Properties (Robert Martin)

| Property | Meaning | Violation |
|----------|---------|-----------|
| **F**ast | Tests run quickly | Slow tests don't get run |
| **I**ndependent | No test depends on another | Order-dependent failures |
| **R**epeatable | Same result every time | Flaky tests erode trust |
| **S**elf-validating | Pass/fail, no manual check | Subjective interpretation |
| **T**imely | Written at the right time | Tests after = coverage gaps |

### Test Pyramid (Mike Cohn)

| Level | Speed | Scope | Count |
|-------|-------|-------|-------|
| Unit | Fast (ms) | Single function/class | 70% |
| Integration | Medium (s) | Multiple components | 20% |
| E2E | Slow (s-min) | Full user flow | 10% |

---

## Key Patterns

| Pattern | Summary |
|---------|---------|
| **AAA (Arrange-Act-Assert)** | One act per test, minimal arrange, specific assert |
| **Test Doubles** | Dummy, Stub, Spy, Mock, Fake — pick the right one |
| **Test Organization** | Co-locate tests, `describe` by noun, `it` by behavior |
| **Fixtures & Factories** | Factory > fixtures; Builder for complex objects |
| **Test Isolation** | DB rollback, module reset, fake timers |
| **Common Patterns** | Async/await, error testing, parameterized tests |

## Reference Loading

When working on a specific area, read the corresponding reference file for detailed rules and code examples:

| Area | Reference |
|------|-----------|
| AAA Pattern | `references/aaa-pattern.md` |
| Test Doubles | `references/test-doubles.md` |
| Test Organization | `references/test-organization.md` |
| Fixtures & Factories | `references/fixtures-and-factories.md` |
| Test Isolation | `references/test-isolation.md` |
| Async, Errors, Events, Parameterized | `references/common-patterns.md` |

---

## Edge Case Discovery

Systematic checklist for identifying *what* to test. Run through each category before writing tests.

### Input Boundaries
- Empty / null / undefined / missing required fields
- Maximum length, minimum length, exactly at limit
- Unicode, emoji, RTL text, special characters
- SQL injection, XSS payloads, script tags
- Negative numbers, zero, floating point precision

### Error States
- Network failure mid-operation (timeout, disconnect)
- Auth expired or revoked during session
- External service returns 500, empty body, malformed JSON
- Disk full, memory pressure, rate limiting
- Partial failure (3 of 5 items succeed)

### User Mistakes
- Double-click submit, rapid repeated actions
- Back button after form submission
- Paste unexpected content into inputs
- Abandon mid-flow, return later
- Use with screen reader, keyboard-only navigation

### State & Timing
- Concurrent access to same resource
- Race conditions (two updates, last-write-wins?)
- Stale data (cache vs source of truth)
- Clock skew, timezone boundaries, DST transitions
- Empty state (first use, no data yet)

### Boundary Conditions
- 0, 1, N-1, N, N+1 (off-by-one)
- First item, last item, only item
- Leap year, month boundaries, epoch edge cases
- Pagination: first page, last page, empty page
- Permissions: owner, member, guest, anonymous

---

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|--------------|---------|-----|
| **Test interdependence** | Tests pass/fail based on order | Full isolation, no shared state |
| **Testing implementation** | Breaks when refactoring | Test behavior, not internals |
| **Excessive mocking** | Tests pass, code broken | Test real integration points |
| **Large Arrange blocks** | Hard to understand | Use factories, builders |
| **Multiple asserts** | Unclear what failed | One concept per test |
| **Magic values** | `expect(result).toBe(42)` | Named constants, clear intent |
| **Commented tests** | Hidden failures | Delete or fix |
| **Sleeping in tests** | `await sleep(1000)` | Wait for condition instead |
| **Test logic** | if/loops in tests | Parameterized tests |

---

## Coverage Guidelines

| Metric | Target | Notes |
|--------|--------|-------|
| Line coverage | 80%+ | Minimum for CI gate |
| Branch coverage | 75%+ | Test conditionals |
| Critical paths | 100% | Auth, payments, data integrity |

**Coverage is not quality** - 100% coverage with bad tests = false confidence.

---

## Quick Reference

```bash
# Run tests
npm test                    # All tests
npm test -- --watch         # Watch mode
npm test -- --coverage      # With coverage
npm test -- UserService     # Filter by name

# Jest flags
--runInBand                 # No parallelization (debugging)
--detectOpenHandles         # Find hanging async
--forceExit                 # Force exit after tests
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **test-driven-development** | Write tests first using these patterns |
| **api-testing** | API-specific patterns |
| **fixing-test-suites** | Debug failing tests |
| **systematic-debugging** | Root cause flaky tests |
