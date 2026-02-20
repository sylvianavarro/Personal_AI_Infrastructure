# Test Isolation

## Database Isolation

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

## Module Isolation

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

## Time Isolation

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
