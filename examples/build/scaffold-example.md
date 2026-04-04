# /scaffold — Example

## Input

```
notifications API endpoint
```

## Expected Output

### Files Created

Following the existing pattern from `src/modules/orders/`:

```
src/modules/notifications/
├── NotificationController.ts     # REST endpoints
├── NotificationService.ts        # Business logic
├── NotificationRepository.ts     # Database access
├── Notification.ts               # Domain model
├── notification.routes.ts        # Route registration
├── __tests__/
│   ├── NotificationService.test.ts
│   └── NotificationController.test.ts
```

### Registrations Added

- `src/routes/index.ts` — Added notification routes import
- `src/di/container.ts` — Registered NotificationService and NotificationRepository

### TODOs Left

Each file contains `// TODO:` markers for business logic:
- `NotificationController.ts` — Define request/response schemas
- `NotificationService.ts` — Implement notification delivery logic
- `NotificationRepository.ts` — Write queries for notification CRUD
- `Notification.ts` — Define notification properties

### Verification

```
$ npm run build — Success (0 errors)
$ npm test — 49 passed (2 new scaffold tests passing with placeholder assertions)
```
