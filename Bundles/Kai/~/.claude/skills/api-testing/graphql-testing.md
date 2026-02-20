# GraphQL Testing Reference

## Basic Query Testing

```typescript
import request from 'supertest';

describe('GraphQL API', () => {
  const query = (q: string, variables = {}) =>
    request(app)
      .post('/graphql')
      .set('Authorization', `Bearer ${token}`)
      .send({ query: q, variables });

  describe('Queries', () => {
    it('fetches user by ID', async () => {
      const response = await query(`
        query GetUser($id: ID!) {
          user(id: $id) {
            id
            email
            name
          }
        }
      `, { id: '123' }).expect(200);

      expect(response.body.data.user).toMatchObject({
        id: '123',
        email: expect.any(String),
      });
      expect(response.body.errors).toBeUndefined();
    });

    it('returns null for nonexistent user', async () => {
      const response = await query(`
        query { user(id: "nonexistent") { id } }
      `).expect(200);

      expect(response.body.data.user).toBeNull();
    });
  });

  describe('Mutations', () => {
    it('creates user', async () => {
      const response = await query(`
        mutation CreateUser($input: CreateUserInput!) {
          createUser(input: $input) {
            id
            email
          }
        }
      `, {
        input: { email: 'new@example.com', name: 'New User' }
      }).expect(200);

      expect(response.body.data.createUser.id).toBeDefined();
    });
  });

  describe('Error handling', () => {
    it('returns validation errors', async () => {
      const response = await query(`
        mutation { createUser(input: { email: "invalid" }) { id } }
      `).expect(200);

      expect(response.body.errors).toHaveLength(1);
      expect(response.body.errors[0].extensions.code).toBe('VALIDATION_ERROR');
    });
  });
});
```

## Testing Subscriptions

```typescript
import { createClient } from 'graphql-ws';

describe('GraphQL Subscriptions', () => {
  let client;

  beforeEach(() => {
    client = createClient({
      url: 'ws://localhost:4000/graphql',
      connectionParams: { authToken: token },
    });
  });

  afterEach(() => {
    client.dispose();
  });

  it('receives real-time updates', (done) => {
    const subscription = client.subscribe(
      {
        query: `
          subscription OnMessageAdded($channelId: ID!) {
            messageAdded(channelId: $channelId) {
              id
              content
            }
          }
        `,
        variables: { channelId: '123' },
      },
      {
        next: (data) => {
          expect(data.data.messageAdded).toBeDefined();
          done();
        },
        error: done,
      }
    );

    // Trigger the subscription
    setTimeout(() => {
      sendMessage({ channelId: '123', content: 'Test' });
    }, 100);
  });
});
```

## Testing N+1 Queries

```typescript
describe('Query Performance', () => {
  it('avoids N+1 queries with DataLoader', async () => {
    const queryCount = { count: 0 };

    // Mock DB to count queries
    jest.spyOn(db, 'query').mockImplementation(async (sql) => {
      queryCount.count++;
      return originalQuery(sql);
    });

    await query(`
      query {
        users(limit: 10) {
          id
          posts { id title }
        }
      }
    `);

    // Should be 2 queries (users + posts), not 11 (users + 10 posts)
    expect(queryCount.count).toBeLessThanOrEqual(3);
  });
});
```

## Testing Authorization

```typescript
describe('Field-level Authorization', () => {
  it('hides email from non-owners', async () => {
    const response = await query(
      `query { user(id: "other-user") { id email } }`,
      {},
      { token: userToken }
    );

    expect(response.body.data.user.id).toBeDefined();
    expect(response.body.data.user.email).toBeNull();
  });

  it('shows email to owner', async () => {
    const response = await query(
      `query { user(id: "current-user") { id email } }`,
      {},
      { token: userToken }
    );

    expect(response.body.data.user.email).toBeDefined();
  });
});
```
