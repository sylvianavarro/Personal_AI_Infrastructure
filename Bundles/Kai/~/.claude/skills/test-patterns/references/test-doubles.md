# Test Doubles (Gerard Meszaros)

| Type | Purpose | When to Use |
|------|---------|-------------|
| **Dummy** | Fill parameter lists | Never actually used |
| **Stub** | Provide canned answers | Control indirect inputs |
| **Spy** | Record calls for verification | Verify interactions |
| **Mock** | Verify expectations | Test collaboration |
| **Fake** | Working implementation | Simpler than real (in-memory DB) |

## Stub Example

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

## Mock Example

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

## When to Use What

| Scenario | Use |
|----------|-----|
| Need specific return value | Stub |
| Need to verify method called | Mock/Spy |
| External service (API, DB) | Fake or Stub |
| Just filling a required param | Dummy |
