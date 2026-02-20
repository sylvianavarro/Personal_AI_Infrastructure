# Common Test Patterns

## Testing Async Code

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

## Testing Errors

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

## Testing Events/Callbacks

```typescript
test('calls onSuccess after save', async () => {
  const onSuccess = jest.fn();

  await saveUser(userData, { onSuccess });

  expect(onSuccess).toHaveBeenCalledTimes(1);
  expect(onSuccess).toHaveBeenCalledWith({ id: expect.any(String) });
});
```

## Parameterized Tests

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
