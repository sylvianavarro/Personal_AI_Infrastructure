# Test Organization

## File Structure

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

## Naming Conventions

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

## Given-When-Then (BDD Style)

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
