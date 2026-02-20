# AAA Pattern (Arrange-Act-Assert)

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

## Rules

- **One Act per test** - Multiple acts = multiple tests
- **Minimal Arrange** - Only what's needed for this test
- **Specific Assert** - Test one behavior, not everything
