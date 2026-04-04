# /debug — Example

## Input

```
TypeError: Cannot read properties of undefined (reading 'map')
    at UserList (src/components/UserList.tsx:14:22)
    at renderWithHooks (node_modules/react-dom/...)
```

## Expected Output

```
**Root Cause**: `users` prop is undefined on first render — the API response
hasn't arrived yet but the component doesn't handle the loading state.

**Location**: src/components/UserList.tsx:14

**Why**: The component destructures `users` from props and immediately calls
`.map()` without checking if the data has loaded. On initial render, the
parent passes `undefined` because the fetch is still in flight.

**Fix**:
  if (!users) {
    return <LoadingSpinner />;
  }
  return users.map(...)

**Confidence**: High
```
