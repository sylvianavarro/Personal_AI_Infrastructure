# Fixtures and Factories

## Factory Pattern (Recommended)

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

## Builder Pattern (Complex Objects)

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

## Shared Fixtures

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
