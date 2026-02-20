# Eliminating Waterfalls

**Priority: CRITICAL | Impact: Can save seconds of load time.**

## Rule 1: Parallel Data Fetching

```tsx
// BAD: Sequential (waterfall)
const user = await getUser();
const posts = await getPosts(user.id);
const comments = await getComments(posts[0].id);

// GOOD: Parallel where possible
const [user, posts] = await Promise.all([
  getUser(),
  getPosts(userId)
]);
```

## Rule 2: Use Suspense Boundaries

```tsx
// BAD: Parent waits for all children
function Page() {
  const data = await fetchAllData(); // blocks everything
  return <Content data={data} />;
}

// GOOD: Independent Suspense boundaries
function Page() {
  return (
    <>
      <Suspense fallback={<HeaderSkeleton />}>
        <Header />
      </Suspense>
      <Suspense fallback={<ContentSkeleton />}>
        <Content />
      </Suspense>
    </>
  );
}
```

## Rule 3: Avoid Fetch-Then-Render

```tsx
// BAD: Component fetches after mount
function Profile() {
  const [user, setUser] = useState(null);
  useEffect(() => {
    fetchUser().then(setUser);
  }, []);
}

// GOOD: Fetch at route level, pass down
// app/profile/page.tsx
async function ProfilePage() {
  const user = await fetchUser();
  return <Profile user={user} />;
}
```
