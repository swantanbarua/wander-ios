# Wander (iOS)

An Airbnb-style travel app, rebuilt from a single design spec to be **clearly better than the
original** — and instrumented so every optimisation is a measured, reproducible number.

This is the **native iOS build** (SwiftUI). The same spec will be built natively for Android
and once as a hybrid app, so the three implementations can be compared side by side.

> **Status: early foundation.** Project skeleton and colour tokens are in place. No screens
> yet. Metrics below are targets from the spec, not measurements — they will be replaced
> with real baseline → optimised numbers in `METRICS.md` as the build progresses.

## Why this exists

Most clones trace the original. Wander starts from a list of things the original gets wrong
and fixes them by design. The 23 product differentiators (D-01…D-23) are the contract for
every screen; the headline ones:

| ID | Wander | The original |
|---|---|---|
| D-01 | All-in price everywhere, by default | Fees hidden until checkout |
| D-02 | Price shown on every calendar date | Dates chosen blind |
| D-05 | Cancellation shown as a timeline | Policy in prose |
| D-06 | Compare tray for shortlisted stays | No comparison |
| D-07 | Distance from *your* anchor point | Distance to city centre only |
| D-10 | Map and list unified | Separate toggled views |
| D-11 | Save without an account | Login wall |
| D-14 | Trips fully usable offline | Needs network |
| D-15 | Full dark mode | None |
| D-16 | Undo instead of confirm dialogs | Confirms, or nothing |
| D-17 | Skeletons, no layout reflow | Spinners and jumps |
| D-19 | Accessibility as a spec, not an afterthought | Inconsistent |
| D-21 | Hard performance budgets | Heavy app |
| D-22 | Small binary | 300 MB+ install |
| D-23 | Every optimisation measured | — |

Plus a 12-feature AI layer (natural-language search, trip planner, review digest, price
forecast, host autopilot…) — everything generated is marked in violet, cites its sources,
and never acts without a tap.

## Engineering targets (to be measured)

| ID | Metric | Target |
|---|---|---|
| M1 | Cold start to first frame | ≤ 1.5 s |
| M2 | Explore time-to-interactive | ≤ 2.5 s |
| M3 | Scroll jank on Explore | < 1 % dropped frames |
| M5 | Peak memory | ≤ 250 MB |
| M6 | Image bytes per session | ≤ 15 MB |
| M7 | Installed size | ≤ 30 MB |
| M8 | Network requests per screen | 1–2 |
| M10 | Test suite | < 5 min, ≥ 80 % coverage |
| M14 | Accessibility audit findings | 0 |

Method: ship the naive build first, record a baseline, then optimise one thing at a time and
re-measure, so each percentage is attributable. Results live in `METRICS.md` (not yet created).

## Stack

| Concern | Choice |
|---|---|
| Language / UI | Swift 6 (strict concurrency), SwiftUI, iOS 17+ |
| Tooling | Xcode 26.6, Swift Testing + XCUITest |
| Architecture | UI → ViewModel (`@Observable`, single `UiState`) → use cases → repositories → platform |
| State / navigation | Unidirectional data flow; `NavigationStack` with a typed route per tab |
| Data | `URLSession` client, SQLite (GRDB), in-house image loader — *planned* |
| Maps | MapKit — *planned* |

## Project layout

```
Wander/
  App/            entry point + composition root
  Core/
    Tokens/       design tokens (Colors.xcassets — 19 colour sets, light + dark)
    Components/   shared UI components (C-01…)
    Networking/   API client
    Data/         repositories, database, cache policy
    Images/       image loading + caching
  Features/       one folder per feature, each owning its screens, ViewModels, use cases
    Explore  Listing  Booking  Wishlists  Trips  Inbox  Host  Profile
WanderTests/      unit tests (Swift Testing)
WanderUITests/    flow tests (XCUITest)
```

## Done so far

- [x] Project skeleton: SwiftUI app, Swift 6 language mode, iOS 17.0 deployment target
- [x] Layered folder structure (App / Core / Features)
- [x] Colour tokens as an asset catalog with Any + Dark appearances — brand palette (6) and neutrals (13), named after the spec's `color.*` tokens
- [ ] Semantic, map and AI colours
- [ ] Typography, spacing, radius, elevation tokens
- [ ] Components (C-01…C-43)
- [ ] Explore → Listing → Booking → Trips → Wishlists → Inbox → Host → Profile
- [ ] Baseline measurements, then the optimisation ladder

## Design source

Built against a visual UI/UX design PDF (every screen in light and dark, component sheets,
flows, motion storyboards, an AI section) and a written companion spec (data model, API
contract, metrics protocol, copy deck). Brand colour `#D42A4E`; AI violet `#6B4EE6`.
