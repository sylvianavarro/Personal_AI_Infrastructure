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

### 1. FIRST Properties (Robert Martin)

| Property | Meaning | Violation |
|----------|---------|-----------|
| **F**ast | Tests run quickly | Slow tests don't get run |
| **I**ndependent | No test depends on another | Order-dependent failures |
| **R**epeatable | Same result every time | Flaky tests erode trust |
| **S**elf-validating | Pass/fail, no manual check | Subjective interpretation |
| **T**imely | Written at the right time | Tests after = coverage gaps |

### 2. Test Pyramid (Mike Cohn)

```
        /\
       /  \  E2E (Few)
      /----\
     /      \  Integration (Some)
    /--------\
   /          \  Unit (Many)
  --------------
```

| Level | Speed | Scope | Count |
|-------|-------|-------|-------|
| Unit | Fast (ms) | Single function/class | 70% |
| Integration | Medium (s) | Multiple components | 20% |
| E2E | Slow (s-min) | Full user flow | 10% |

---

## AAA Pattern (Arrange-Act-Assert)

**Industry standard structure for every test.**

```typescript
test('calculates order total with discount', () => {
  // Arrange - Set up test data and dependencies
  const order = createOrder({ items: [{ price: 100 }] });
  const discount = { percent: 10 };

  // Act - Execute the behavior being tested
  const total = calculateTotal(order, discount);

  // Assert - Verify the expected outcome
  expect(total).toBe(90);
});
```

### Rules

- **One Act per test** - Multiple acts = multiple tests
- **Minimal Arrange** - Only what's needed for this test
- **Specific Assert** - Test one behavior, not everything

---

## Test Doubles (Gerard Meszaros)

| Type | Purpose | When to Use |
|------|---------|-------------|
| **Dummy** | Fill parameter lists | Never actually used |
| **Stub** | Provide canned answers | Control indirect inputs |
| **Spy** | Record calls for verification | Verify interactions |
| **Mock** | Verify expectations | Test collaboration |
| **Fake** | Working implementation | Simpler than real (in-memory DB) |

### Stub Example

```typescript
// Stub: Returns canned data, no verification
const userService = {
  getUser: jest.fn().mockReturnValue({ id: 1, name: 'Test' })
};

test('displays user name', () => {
  render(<Profile userService={userService} />);
  expect(screen.getByText('Test')).toBeInTheDocument();
});
```

### Mock Example

```typescript
// Mock: Verifies interactions
const emailService = { send: jest.fn() };

test('sends welcome email on registration', async () => {
  await registerUser({ email: 'test@example.com' }, emailService);

  expect(emailService.send).toHaveBeenCalledWith({
    to: 'test@example.com',
    template: 'welcome'
  });
});
```

### When to Use What

| Scenario | Use |
|----------|-----|
| Need specific return value | Stub |
| Need to verify method called | Mock/Spy |
| External service (API, DB) | Fake or Stub |
| Just filling a required param | Dummy |

---

## Test Organization

### File Structure

```
src/
├── components/
│   └── Button/
│       ├── Button.tsx
│       └── Button.test.tsx     # Co-located
├── services/
│   └── UserService.ts
└── __tests__/                   # Or separate
    └── services/
        └── UserService.test.ts
```

**Co-location preferred** - Tests next to implementation.

### Naming Conventions

```typescript
// File: [Component].test.ts or [Component].spec.ts

// Describe blocks: noun (what)
describe('UserService', () => {
  describe('createUser', () => {

    // Test names: should + behavior
    it('should create user with valid data', () => {});
    it('should throw error when email exists', () => {});
    it('should hash password before saving', () => {});
  });
});
```

### Given-When-Then (BDD Style)

```typescript
describe('Shopping Cart', () => {
  describe('given a cart with items', () => {
    describe('when applying a valid coupon', () => {
      it('then reduces total by coupon amount', () => {});
    });

    describe('when applying an expired coupon', () => {
      it('then shows error message', () => {});
      it('then keeps original total', () => {});
    });
  });
});
```

---

## Fixtures and Factories

### Factory Pattern (Recommended)

```typescript
// factories/user.ts
export function createUser(overrides: Partial<User> = {}): User {
  return {
    id: faker.string.uuid(),
    email: faker.internet.email(),
    name: faker.person.fullName(),
    createdAt: new Date(),
    ...overrides  // Allow overriding specific fields
  };
}

// In tests
const user = createUser({ email: 'specific@test.com' });
const admin = createUser({ role: 'admin' });
```

### Builder Pattern (Complex Objects)

```typescript
class OrderBuilder {
  private order: Partial<Order> = {};

  withItems(items: Item[]) {
    this.order.items = items;
    return this;
  }

  withDiscount(percent: number) {
    this.order.discount = { percent };
    return this;
  }

  build(): Order {
    return {
      id: faker.string.uuid(),
      items: [],
      ...this.order
    } as Order;
  }
}

// Usage
const order = new OrderBuilder()
  .withItems([{ sku: 'ABC', price: 100 }])
  .withDiscount(10)
  .build();
```

### Shared Fixtures

```typescript
// fixtures/index.ts
export const fixtures = {
  validUser: createUser({ email: 'valid@test.com' }),
  adminUser: createUser({ role: 'admin' }),
  expiredToken: 'expired.jwt.token',
};

// In tests
import { fixtures } from '../fixtures';
test('admin can delete users', () => {
  const result = deleteUser(fixtures.adminUser, targetId);
});
```

---

## Test Isolation

### Database Isolation

```typescript
// Transaction rollback (fastest)
beforeEach(async () => {
  await db.beginTransaction();
});

afterEach(async () => {
  await db.rollback();
});

// Or: Truncate tables
beforeEach(async () => {
  await db.truncateAll();
});

// Or: Separate test database
// DATABASE_URL_TEST=postgres://localhost/myapp_test
```

### Module Isolation

```typescript
// Reset modules between tests
beforeEach(() => {
  jest.resetModules();
});

// Clear all mocks
afterEach(() => {
  jest.clearAllMocks();
});
```

### Time Isolation

```typescript
// Control time in tests
beforeEach(() => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date('2024-01-15'));
});

afterEach(() => {
  jest.useRealTimers();
});
```

---

## Common Patterns

### Testing Async Code

```typescript
// Async/await (preferred)
test('fetches user data', async () => {
  const user = await fetchUser(1);
  expect(user.name).toBe('John');
});

// With rejection
test('throws on invalid id', async () => {
  await expect(fetchUser(-1)).rejects.toThrow('Invalid ID');
});
```

### Testing Errors

```typescript
// Sync errors
test('throws on invalid input', () => {
  expect(() => validate(null)).toThrow('Input required');
});

// Async errors
test('rejects on network failure', async () => {
  mockFetch.mockRejectedValue(new Error('Network error'));

  await expect(fetchData()).rejects.toThrow('Network error');
});

// Error properties
test('throws ValidationError with details', () => {
  try {
    validate({ email: 'invalid' });
    fail('Should have thrown');
  } catch (error) {
    expect(error).toBeInstanceOf(ValidationError);
    expect(error.field).toBe('email');
  }
});
```

### Testing Events/Callbacks

```typescript
test('calls onSuccess after save', async () => {
  const onSuccess = jest.fn();

  await saveUser(userData, { onSuccess });

  expect(onSuccess).toHaveBeenCalledTimes(1);
  expect(onSuccess).toHaveBeenCalledWith({ id: expect.any(String) });
});
```

### Parameterized Tests

```typescript
// Test multiple cases with same logic
test.each([
  { input: '', expected: false },
  { input: 'a', expected: false },
  { input: 'abc@', expected: false },
  { input: 'test@example.com', expected: true },
])('validates email "$input" as $expected', ({ input, expected }) => {
  expect(isValidEmail(input)).toBe(expected);
});

// Table format
test.each`
  a    | b    | expected
  ${1} | ${2} | ${3}
  ${2} | ${3} | ${5}
`('adds $a + $b = $expected', ({ a, b, expected }) => {
  expect(add(a, b)).toBe(expected);
});
```

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
| **api-testing** | API-specific patterns |
| **fixing-test-suites** | Debug failing tests |
| **commit** | Run tests before committing |
