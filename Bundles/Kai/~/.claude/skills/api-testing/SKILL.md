---
name: api-testing
description: Use when testing REST APIs, GraphQL endpoints, writing integration tests for backends, or setting up API test automation.
---

# API Testing

Industry best practices for testing APIs.

## When to Use

- Writing tests for REST/GraphQL endpoints
- Setting up API integration tests
- Testing authentication/authorization
- Contract testing between services
- Validating error responses

---

## API Test Pyramid

| Level | What to Test | Tools | Count |
|-------|--------------|-------|-------|
| Unit | Validators, serializers | Jest, pytest | 70% |
| Integration | Full endpoint behavior | Supertest, httpx | 20% |
| Contract | API shape compatibility | Pact, OpenAPI | 10% |

---

## REST API Testing

### Basic Pattern (Supertest/Jest)

```typescript
describe('GET /api/users/:id', () => {
  it('returns user when found', async () => {
    const response = await request(app)
      .get('/api/users/123')
      .set('Authorization', `Bearer ${token}`)
      .expect('Content-Type', /json/)
      .expect(200);

    expect(response.body).toMatchObject({
      id: '123',
      email: expect.any(String),
    });
  });

  it('returns 404 when not found', async () => {
    await request(app)
      .get('/api/users/nonexistent')
      .set('Authorization', `Bearer ${token}`)
      .expect(404);
  });
});
```

### Python (pytest + httpx)

```python
@pytest.mark.asyncio
async def test_get_user(client, auth_headers):
    response = await client.get("/api/users/123", headers=auth_headers)
    assert response.status_code == 200
    assert response.json()["id"] == "123"
```

---

## Status Code Coverage

**Required coverage for every API:**

| Status | Meaning | Test Scenario |
|--------|---------|---------------|
| 200 | OK | Successful GET/PUT |
| 201 | Created | Successful POST |
| 204 | No Content | Successful DELETE |
| 400 | Bad Request | Invalid JSON |
| 401 | Unauthorized | Missing/invalid token |
| 403 | Forbidden | Insufficient permissions |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Duplicate resource |
| 422 | Unprocessable | Validation failed |
| 429 | Too Many Requests | Rate limited |
| 500 | Server Error | Unexpected failure |

---

## Authentication Testing

```typescript
describe('Authentication', () => {
  it('accepts valid token', async () => {
    await request(app)
      .get('/api/protected')
      .set('Authorization', `Bearer ${validToken}`)
      .expect(200);
  });

  it('rejects missing token', async () => {
    await request(app).get('/api/protected').expect(401);
  });

  it('rejects expired token', async () => {
    await request(app)
      .set('Authorization', `Bearer ${expiredToken}`)
      .get('/api/protected')
      .expect(401);
  });
});

describe('Authorization', () => {
  it('allows admin to admin routes', async () => {
    await request(app)
      .get('/api/admin/users')
      .set('Authorization', `Bearer ${adminToken}`)
      .expect(200);
  });

  it('denies user to admin routes', async () => {
    await request(app)
      .get('/api/admin/users')
      .set('Authorization', `Bearer ${userToken}`)
      .expect(403);
  });
});
```

---

## Request Validation Testing

```typescript
describe('POST /api/users validation', () => {
  it('requires email', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ name: 'Test' })
      .expect(422);

    expect(response.body.errors[0].field).toBe('email');
  });

  it('validates email format', async () => {
    await request(app)
      .post('/api/users')
      .send({ email: 'not-an-email', name: 'Test' })
      .expect(422);
  });

  it('sanitizes XSS', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({ name: '<script>alert("xss")</script>', email: 'test@example.com' })
      .expect(201);

    expect(response.body.name).not.toContain('<script>');
  });
});
```

---

## Response Format Testing

```typescript
describe('Response format', () => {
  it('returns consistent error format', async () => {
    const response = await request(app)
      .get('/api/users/nonexistent')
      .expect(404);

    expect(response.body).toMatchObject({
      error: expect.any(String),
      code: expect.any(String),
    });
  });

  it('includes pagination meta', async () => {
    const response = await request(app)
      .get('/api/users')
      .expect(200);

    expect(response.body.meta).toMatchObject({
      total: expect.any(Number),
      page: expect.any(Number),
    });
  });
});
```

---

## GraphQL Testing

See `graphql-testing.md` for complete patterns including:
- Query/mutation testing
- Subscription testing
- N+1 query detection
- Field-level authorization

**Quick example:**

```typescript
const query = (q: string, variables = {}) =>
  request(app).post('/graphql').send({ query: q, variables });

it('fetches user', async () => {
  const response = await query(`
    query { user(id: "123") { id email } }
  `).expect(200);

  expect(response.body.errors).toBeUndefined();
});
```

---

## Contract Testing

See `contract-testing.md` for complete patterns including:
- Pact consumer/provider tests
- OpenAPI schema validation
- Backward compatibility testing

**Quick example (Pact):**

```typescript
await provider.addInteraction({
  state: 'user exists',
  uponReceiving: 'get user request',
  withRequest: { method: 'GET', path: '/api/users/123' },
  willRespondWith: {
    status: 200,
    body: { id: '123', email: Matchers.email() },
  },
});
```

---

## Test Data Management

### Factories

```typescript
export const createUserPayload = (overrides = {}) => ({
  email: faker.internet.email(),
  name: faker.person.fullName(),
  password: 'SecurePass123!',
  ...overrides,
});
```

### Database Isolation

```typescript
beforeEach(async () => {
  await db.beginTransaction();
});

afterEach(async () => {
  await db.rollback();
});
```

---

## Performance Testing

```typescript
it('responds within SLA', async () => {
  const start = Date.now();
  await request(app).get('/api/users').expect(200);
  expect(Date.now() - start).toBeLessThan(200);
});

it('handles concurrent requests', async () => {
  const requests = Array(100).fill(null).map(() =>
    request(app).get('/api/health')
  );
  const responses = await Promise.all(requests);
  expect(responses.every(r => r.status === 200)).toBe(true);
});
```

---

## Quick Checklist

- [ ] All CRUD operations tested
- [ ] All status codes covered
- [ ] Auth tested (valid, invalid, expired, missing)
- [ ] Authorization tested (roles, ownership)
- [ ] Validation tested (required, format, limits)
- [ ] Error format consistent
- [ ] Pagination tested
- [ ] Rate limiting tested
- [ ] No sensitive data in responses

---

## Integration

| Skill | Integration |
|-------|-------------|
| **test-patterns** | General testing patterns |
| **test-driven-development** | Write API tests first |
| **systematic-debugging** | Debug failing tests |
