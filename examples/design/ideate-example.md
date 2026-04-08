# /ideate — Example

## Input

```
How should we handle real-time table availability updates?
```

## Expected Output

### Option 1: Polling

**How it works:** Client polls a REST endpoint every 10-15 seconds for the latest availability. Server queries the database on each request.

**Pros:**
- Dead simple to implement — standard REST, no new infrastructure
- Works everywhere — no WebSocket compatibility concerns
- Easy to cache at the CDN level

**Cons:**
- Stale data between polls — 10-15 seconds of potential inaccuracy
- Wasted requests when nothing changes (most of the time)
- Scales poorly — 1000 users × 4 polls/min = 4000 req/min to the availability service

**Effort:** Low
**Risk:** Database pressure at scale during peak booking times

---

### Option 2: WebSockets

**How it works:** Client opens a persistent WebSocket connection. Server pushes availability changes in real-time as they happen.

**Pros:**
- True real-time — updates arrive within milliseconds
- Efficient — only sends data when something actually changes
- Good UX — tables appear/disappear live

**Cons:**
- New infrastructure — need WebSocket server, connection management, reconnection logic
- Stateful connections complicate horizontal scaling and deploys
- Mobile clients on flaky networks will constantly reconnect

**Effort:** High
**Risk:** Operational complexity — WebSocket servers are harder to monitor, debug, and scale than REST endpoints

---

### Option 3: Server-Sent Events (SSE)

**How it works:** Client opens a one-way HTTP stream. Server pushes availability changes as events. Client receives updates without polling.

**Pros:**
- Real-time push without the complexity of WebSockets
- Built on standard HTTP — works with existing load balancers, proxies, CDNs
- Auto-reconnection built into the browser API
- Simpler than WebSockets since we only need server→client updates

**Cons:**
- One-directional — if we later need client→server streaming, we'd need to add WebSockets anyway
- Connection limits per domain in older browsers (6 per domain)
- Less ecosystem support in mobile native than WebSockets

**Effort:** Medium
**Risk:** Low — falls back to polling gracefully if SSE isn't supported

---

### Option 4: Event-driven with push notifications

**How it works:** No persistent connection. When availability changes significantly (e.g., a table opens for a time slot the user is viewing), send a push notification or in-app message. Client fetches fresh data on resume.

**Pros:**
- No persistent connections at all — simplest server-side architecture
- Works when the app is backgrounded
- Low server cost — only sends messages when relevant changes happen

**Cons:**
- Not truly real-time — push delivery can be delayed 1-30 seconds
- Noisy — too many notifications annoy users
- Only works for coarse-grained updates, not live availability grids

**Effort:** Low
**Risk:** Poor UX for the "actively browsing tables" use case

---

### Recommendation

**Option 3 (SSE)** — it gives us real-time updates with half the complexity of WebSockets. Our use case is purely server→client (availability changes pushed to viewers), so we don't need bidirectional communication. SSE works over standard HTTP, plays well with our existing AWS infrastructure, and degrades gracefully.

Choose **Option 2 (WebSockets)** instead if we plan to add features that need bidirectional streaming — like live chat with restaurants or collaborative booking.

Choose **Option 1 (Polling)** if we need this shipped this week and can accept 10-15 second staleness.
