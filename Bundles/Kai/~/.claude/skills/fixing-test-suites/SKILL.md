---
name: fixing-test-suites
description: Use when fixing failing tests, especially auth mocking issues in Flask/pytest or React/Jest service mocking patterns
---

# Fixing Test Suites

## Overview

Patterns for fixing common test failures in Flask/pytest and React/Jest test suites.

**Core principle:** Test failures usually stem from mock timing, import order, or assertion mismatches - not the code under test.

## When to Use

- Fixing auth-related test failures (401 responses in tests)
- Fixing API/service mock issues in React tests
- Tests timing out waiting for elements
- Tests failing due to text not matching exactly

## Flask/Pytest Auth Mocking

### Problem: Tests return 401 Unauthorized

The `require_auth` decorator is applied at import time. Patching after import doesn't work.

### Solution: Patch at module level BEFORE import

```python
# test_my_feature.py
import pytest
from unittest.mock import patch

# Patch BEFORE importing the blueprint
_auth_patch = patch("api.middleware.auth.AUTH_SECRET_KEY", None)
_auth_patch.start()

# NOW import - decorator sees AUTH_SECRET_KEY as None and skips auth
from api.routes.resources import resources_bp

# Stop patch after import to avoid affecting other test files
_auth_patch.stop()


@pytest.fixture
def bypass_auth():
    """Keep auth bypassed during test execution."""
    with patch("api.middleware.auth.AUTH_SECRET_KEY", None):
        yield


@pytest.fixture
def app(bypass_auth):
    """Create test Flask app with auth bypassed."""
    from flask import Flask
    app = Flask(__name__)
    app.config["TESTING"] = True
    app.register_blueprint(resources_bp)
    return app


@pytest.fixture
def client(app):
    return app.test_client()
```

### Key Points

1. **Module-level patch**: Must happen BEFORE any imports that use the decorator
2. **Stop after import**: Prevents leaking to other test files
3. **Fixture chain**: `bypass_auth` → `app` → `client` ensures patch active during tests
4. **Use `yield`**: Keeps context manager active for test duration

### Anti-Pattern: Patching the decorator location

```python
# WRONG - decorator already applied when resources_bp loaded
with patch("api.middleware.auth.require_auth", lambda f: f):
    from api.routes.resources import resources_bp  # Too late!
```

## React/Jest Service Mocking

### Problem: API mocks not applied, tests timeout

Jest module mocks must use factory functions and be set up before component import.

### Solution: Explicit mock factory + inline mock setup

```javascript
// At top of test file - explicit mock factory
jest.mock("../../services/api", () => ({
  getClientEngagementsUtil: jest.fn(),
  getSalesPipelineDealsCount: jest.fn(),
}));

// In each test - set mock return value BEFORE render
test("displays data correctly", async () => {
  const { getClientEngagementsUtil } = require("../../services/api");
  getClientEngagementsUtil.mockResolvedValue(mockData);

  render(<Component />);

  await waitFor(() => {
    expect(screen.getByText(/expected text/)).toBeInTheDocument();
  });
});
```

### Key Points

1. **Factory function**: `jest.mock("path", () => ({ ... }))` - returns mock object
2. **Inline require**: Get mock in test, set return value before render
3. **Clear mocks**: Use `beforeEach(() => jest.clearAllMocks())`
4. **Order matters**: Mock setup → render → assertions

### Anti-Pattern: Auto-mock without factory

```javascript
// WRONG - jest.mock without factory may not mock all exports
jest.mock("../../services/api");

// Then in test
api.getClientEngagementsUtil.mockResolvedValue(data);  // May be undefined!
```

## Common Assertion Fixes

### Problem: Text appears but getByText fails

Component combines text: `"Project 1 / Project 1"` but test looks for `"Project 1"`

### Solution: Use regex or combined text

```javascript
// Option 1: Regex match
expect(screen.getByText(/Project 1/)).toBeInTheDocument();

// Option 2: More specific regex
expect(screen.getByText(/Project 1 \//)).toBeInTheDocument();

// Option 3: Exact combined text
expect(screen.getByText("Project 1 / Project 1")).toBeInTheDocument();
```

### Problem: Text appears multiple times

Summary cards and table both show "91.4%"

### Solution: Use getAllByText with length check

```javascript
// Check text appears at least once
expect(screen.getAllByText("91.4%").length).toBeGreaterThan(0);

// Or scope to specific container
const table = screen.getByRole("table");
expect(within(table).getByText("91.4%")).toBeInTheDocument();
```

### Problem: Element not displayed but test expects it

Company name used for filtering but not rendered in table

### Solution: Test actual behavior, not assumed behavior

```javascript
// WRONG - assumes company name is displayed
await waitFor(() => {
  expect(screen.getByText("Test Company")).toBeInTheDocument();
});

// RIGHT - check for what IS displayed
await waitFor(() => {
  expect(screen.getByText(/Test Project Alpha/)).toBeInTheDocument();
});
```

## Debugging Test Failures

### Step 1: Check what's actually rendered

```javascript
// Print DOM to console
screen.debug();

// Or with specific element
screen.debug(screen.getByRole("table"));
```

### Step 2: Check mock was called

```javascript
expect(mockFunction).toHaveBeenCalled();
expect(mockFunction).toHaveBeenCalledWith(expectedArgs);
console.log(mockFunction.mock.calls);
```

### Step 3: Check for async timing

```javascript
// Increase timeout for slow operations
await waitFor(() => {
  expect(screen.getByText("loaded")).toBeInTheDocument();
}, { timeout: 5000 });
```

## CI/CD Considerations

### Tests must not have `continue-on-error: true`

```yaml
# WRONG - tests don't block deployment
- name: Run tests
  continue-on-error: true
  run: npm test

# RIGHT - tests block deployment
- name: Run tests
  run: npm test
```

### Environment variables in CI

```yaml
env:
  TESTING: "true"  # Enables test mode in backend
  AUTH_SECRET_KEY: ""  # Empty = auth bypassed
```

## Verification Checklist

Before marking test fix complete:

- [ ] All tests pass locally
- [ ] No `continue-on-error: true` in CI workflow
- [ ] Mock cleanup in `beforeEach`/`afterEach`
- [ ] Module-level patches stopped after import
- [ ] Assertions match actual DOM output
- [ ] Async operations use `waitFor`

## Related Skills

- `test-patterns` - Testing conventions and organization
- `api-testing` - API-specific testing patterns
- `knowledge-accumulation` - Document test fixes for future reference
