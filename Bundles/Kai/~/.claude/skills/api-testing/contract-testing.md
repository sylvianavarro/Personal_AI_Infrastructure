# Contract Testing Reference

## Pact (Consumer-Driven Contracts)

### Consumer Test (Frontend)

```typescript
import { Pact, Matchers } from '@pact-foundation/pact';

const provider = new Pact({
  consumer: 'frontend',
  provider: 'user-service',
  port: 1234,
});

describe('User Service Contract', () => {
  beforeAll(() => provider.setup());
  afterAll(() => provider.finalize());
  afterEach(() => provider.verify());

  describe('GET /api/users/:id', () => {
    it('returns user for valid ID', async () => {
      // Define expected interaction
      await provider.addInteraction({
        state: 'user 123 exists',
        uponReceiving: 'a request for user 123',
        withRequest: {
          method: 'GET',
          path: '/api/users/123',
          headers: { Authorization: 'Bearer valid-token' },
        },
        willRespondWith: {
          status: 200,
          headers: { 'Content-Type': 'application/json' },
          body: {
            id: '123',
            email: Matchers.email(),
            name: Matchers.string(),
            createdAt: Matchers.iso8601DateTime(),
          },
        },
      });

      // Make request against mock
      const response = await userClient.getUser('123');

      expect(response.id).toBe('123');
    });

    it('returns 404 for missing user', async () => {
      await provider.addInteraction({
        state: 'user does not exist',
        uponReceiving: 'a request for nonexistent user',
        withRequest: {
          method: 'GET',
          path: '/api/users/nonexistent',
        },
        willRespondWith: {
          status: 404,
          body: {
            error: Matchers.string(),
            code: 'USER_NOT_FOUND',
          },
        },
      });

      await expect(userClient.getUser('nonexistent')).rejects.toThrow();
    });
  });
});
```

### Provider Verification

```typescript
import { Verifier } from '@pact-foundation/pact';

describe('Provider Verification', () => {
  it('validates against consumer contracts', async () => {
    const verifier = new Verifier({
      provider: 'user-service',
      providerBaseUrl: 'http://localhost:3000',
      pactUrls: ['./pacts/frontend-user-service.json'],
      stateHandlers: {
        'user 123 exists': async () => {
          await db.users.create({ id: '123', email: 'test@example.com' });
        },
        'user does not exist': async () => {
          await db.users.deleteAll();
        },
      },
    });

    await verifier.verifyProvider();
  });
});
```

## OpenAPI Contract Testing

### Schema Validation

```typescript
import { OpenAPIValidator } from 'openapi-backend';

const validator = new OpenAPIValidator({
  definition: './openapi.yaml',
});

describe('OpenAPI Compliance', () => {
  it('response matches schema', async () => {
    const response = await request(app).get('/api/users/123');

    const validation = validator.validateResponse(
      response.body,
      'getUser',
      response.status
    );

    expect(validation.valid).toBe(true);
  });

  it('request matches schema', async () => {
    const requestBody = { email: 'test@example.com', name: 'Test' };

    const validation = validator.validateRequest({
      method: 'POST',
      path: '/api/users',
      body: requestBody,
    });

    expect(validation.valid).toBe(true);
  });
});
```

### Automated OpenAPI Testing

```typescript
import SwaggerParser from '@apidevtools/swagger-parser';

describe('OpenAPI Spec', () => {
  let spec;

  beforeAll(async () => {
    spec = await SwaggerParser.validate('./openapi.yaml');
  });

  it('spec is valid', () => {
    expect(spec).toBeDefined();
  });

  // Generate tests from spec
  Object.entries(spec.paths).forEach(([path, methods]) => {
    Object.entries(methods).forEach(([method, operation]) => {
      if (['get', 'post', 'put', 'delete'].includes(method)) {
        it(`${method.toUpperCase()} ${path} returns documented status`, async () => {
          const response = await request(app)[method](path);
          const expectedStatuses = Object.keys(operation.responses).map(Number);

          expect(expectedStatuses).toContain(response.status);
        });
      }
    });
  });
});
```

## API Compatibility Testing

```typescript
describe('Backward Compatibility', () => {
  it('v1 response still includes deprecated fields', async () => {
    const response = await request(app)
      .get('/api/v1/users/123')
      .expect(200);

    // Old field still present for v1
    expect(response.body.userName).toBeDefined();
    // New field also present
    expect(response.body.name).toBeDefined();
  });

  it('v2 response excludes deprecated fields', async () => {
    const response = await request(app)
      .get('/api/v2/users/123')
      .expect(200);

    // Old field removed in v2
    expect(response.body.userName).toBeUndefined();
    // New field only
    expect(response.body.name).toBeDefined();
  });
});
```
