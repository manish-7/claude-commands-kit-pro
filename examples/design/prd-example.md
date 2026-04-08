# /prd — Example

## Input

```
User should be able to cancel a reservation up to 2 hours before the booking time
```

## Expected Output

## Problem Statement

Guests currently have no way to cancel a reservation through the app. They either call the restaurant (frustrating for both sides) or simply no-show (costs the restaurant a table and revenue). This is the #2 support ticket category at 18% of volume.

## Goals & Success Metrics

- Reduce no-show rate from 12% to under 5%
- Reduce "cancel reservation" support tickets by 80%
- Maintain restaurant trust — cancellations should free tables fast enough to be rebooked
- Track: cancellation rate, rebook rate, no-show rate, support ticket volume

## User Stories

- As a guest, I want to cancel my reservation from the app so that I don't have to call the restaurant
- As a guest, I want to see the cancellation deadline clearly so that I know when I can still cancel
- As a restaurant manager, I want cancelled tables to immediately reappear as available so that I can rebook them
- As a restaurant manager, I want to see why guests cancel so that I can identify patterns

## Requirements

### Must Have (P0)
- Guest can cancel from the reservation detail screen
  - Acceptance: "Cancel reservation" button visible, one-tap with confirmation dialog
- 2-hour cutoff enforced — cancellations blocked within 2 hours of booking time
  - Acceptance: button disabled with message "Cancellation window has passed" when <2hrs
- Cancelled table immediately returns to available inventory
  - Acceptance: table shows as bookable within 30 seconds of cancellation
- Confirmation email/push sent to guest on cancellation
  - Acceptance: notification delivered within 1 minute

### Should Have (P1)
- Cancellation reason prompt (optional, multi-choice: plans changed, found another restaurant, illness, other)
  - Acceptance: reason stored and visible in restaurant dashboard
- Restaurant notified of cancellation via push notification
  - Acceptance: notification includes guest name, party size, time slot

### Nice to Have (P2)
- Configurable cancellation window per restaurant (default 2 hours)
- Waitlist auto-notify when a cancelled slot opens up

## User Experience

1. Guest opens reservation detail → sees "Cancel Reservation" button
2. Taps cancel → confirmation dialog: "Cancel your reservation at [Restaurant] on [Date] at [Time]?"
3. Optional: "Mind telling us why?" with quick-select reasons
4. Confirms → reservation cancelled → confirmation screen with "Done" message
5. If within 2-hour window → button shows "Cancellation window has passed" with tooltip

## Out of Scope

- Partial cancellations (reducing party size) — separate feature
- Cancellation fees or penalties — requires payment integration
- Restaurant-initiated cancellations — different flow, different stakeholders

## Dependencies & Risks

- **Availability engine**: cancelled tables must sync back immediately — need to verify the availability service can handle real-time updates
- **Notification service**: must support cancellation event type
- **Risk**: guests may cancel-and-rebook to game the system (e.g., hold multiple slots). Mitigation: rate limit cancellations per guest per week.

## Open Questions

- Should guests be able to cancel partial reservations (reduce party size from 6 to 4)?
- Do we want a "soft cancel" grace period where the guest can undo?
- What's the policy for repeat cancellers — should restaurants see a cancellation score?
