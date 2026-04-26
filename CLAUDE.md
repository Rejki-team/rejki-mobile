# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Workflow — Always Follow 3 Phases

Every coding task requires these phases in order:

```
/analyze  →  /implement  →  /review
```

- `/analyze` — Determine the exact layer(s), list all files, check for dependency issues, produce a plan
- `/implement` — Execute the plan using skills and the standards below
- `/review` — Self-review against `.claude/docs/review-checklist.md`

Full workflow details: `.claude/CLAUDE.md`
Layer routing decisions: `.claude/docs/layer-routing.md`
Review checklist: `.claude/docs/review-checklist.md`

---

## Commands

All monorepo tasks use Melos (configured in `pubspec.yaml`):

```bash
# Dependencies
melos get                    # Get deps for all packages
melos clean                  # Clean all packages

# Code quality
melos analyze                # Run flutter analyze across all packages
melos format                 # Format all packages (dart format .)
melos fix                    # Apply dart fix --apply to all packages

# Testing
melos test                   # Run tests in packages that have a test/ dir

# Code generation (must run in dependency order)
melos build_runner           # Full ordered build: core → domain → data → features → di
melos build:core             # Build core only
melos build:domain           # Build domain only
melos build:data             # Build data only
melos build:features         # Build all feature_* packages (concurrency=4)
melos build:di               # Build DI last
melos build_runner:clean     # Clean build_runner cache in all packages
```

**Important**: Always run code generation in dependency order. `melos build_runner:parallel` can fail on cross-package generated files.

---

## Architecture

This is a **23-package monorepo** using Clean Architecture with strict layer separation.

### Package Dependency Graph

```
feature_* packages
    └── domain, designsystems, components, shared_widgets
data
    └── domain, network, local
domain
    └── core
di
    └── (all packages — registered last)
```

### Layer Responsibilities

| Package | Role |
|---|---|
| `packages/core` | Pure Dart utilities, constants, base types — zero Flutter deps |
| `packages/domain` | Business entities, repository interfaces, use cases, failures, params |
| `packages/data` | DTOs (Freezed + JSON), datasources (Dio), repository impls |
| `packages/network` | Dio client, interceptors, token refresh, connectivity |
| `packages/local` | SharedPreferences and flutter_secure_storage abstractions |
| `packages/di` | GetIt + Injectable registration for all packages |
| `packages/app` | go_router routes, app-level theme, MaterialApp |
| `packages/designsystems` | Design tokens: colors, typography, spacing, dimensions, shadows, animations |
| `packages/components` | Reusable widgets (buttons, inputs, cards) built on design tokens |
| `packages/shared_widgets` | Utility widgets shared across features |
| `packages/features/feature_*` | Self-contained feature modules (presentation only) |

### State Management

- **BLoC** for multi-event flows: `sealed class XEvent` + `sealed class XState` (both Freezed)
- **Cubit** for simple state: `sealed class XState` (Freezed)
- Status enum pattern: `initial | loading | success | failure`
- Error propagation: `fpdart` `Either<XFailure, T>` — `.fold()` in BLoC/Cubit handlers

### Dependency Injection

- `GetIt` instance in `packages/di/lib/src/injection.dart`
- Annotations: `@injectable` on BLoCs/Cubits/use cases, `@lazySingleton` on repositories/datasources
- `configureDependencies()` called in `main.dart` before `runApp()`
- After adding any `@injectable` annotation: run `melos build:di`

### Navigation

- `go_router` routes defined in `packages/app/lib/src/router/`
- `context.go()` replaces stack, `context.push()` adds to stack

### Freezed (version 3.x — enforced)

- Data classes: `@freezed abstract class Foo with _$Foo`
- Union types (events/failures): `@freezed sealed class Foo with _$Foo`
- Custom getters require private constructor: `const Foo._();`
- Default values: `@Default(value)` — never inline `= value` in factory
- JSON models: declare both `part '*.freezed.dart'` and `part '*.g.dart'`

See `.claude/skills/flutter-freezed/SKILL.md` for the complete reference.

### Adding a New Feature

1. Create `packages/features/feature_<name>/` with `pubspec.yaml`
2. Add path to `workspace` in root `pubspec.yaml`
3. Annotate BLoC/Cubit with `@injectable`, run `melos build:di`
4. Add routes in `packages/app/lib/src/router/`
5. Export public API through barrel file (`feature_<name>.dart`)

See `docs/JOB_FEATURE_IMPLEMENTATION_GUIDE.md` for step-by-step walkthrough.

---

## Quality Rules

### Wajib Pada Setiap Perubahan
- **Jangan over-engineering** — implementasikan hanya yang diminta.
- **Freezed + abstract class** — selalu gunakan `abstract class` saat mendefinisikan model/union dengan Freezed:
  ```dart
  @freezed
  abstract class MyModel with _$MyModel { ... }
  ```
- **Safe rebuild** — gunakan `BlocSelector` atau `context.select()` untuk membatasi rebuild hanya pada state yang berubah. Hindari `BlocBuilder` yang listen ke seluruh state jika hanya sebagian field yang dibutuhkan.
- **Test** — wajib buat atau perbarui test yang relevan dan pastikan lolos (`melos test`).
- **Referensi feature lain** — sebelum membuat komponen atau pola baru, cek apakah ada design yang sama di feature lain dan referensikan.

### Code Quality (Non-Negotiable)
- **No ANR** — semua operasi I/O, database, dan network harus di luar main isolate atau dibungkus `async/await`.
- **No Memory Leak** — dispose semua `StreamSubscription`, `AnimationController`, `ScrollController`, dan `TextEditingController` di `dispose()`.
- **No Race Condition** — jangan emit state dari multiple async calls tanpa guard. Gunakan `isClosed` check sebelum emit di BLoC/Cubit.
- **No God Class / God Function** — satu file tidak boleh melebihi ~300 baris; pisahkan BLoC/Cubit per domain.
- **No Code Smell** — tidak ada dead code, commented-out code, atau magic numbers.
- **No Hardcoded Styling** — semua warna, ukuran, font, dan spacing dari `packages/designsystems`. Tidak ada hex literal, `Colors.xxx`, atau pixel value inline.
- **No Deprecated Code** — tidak ada API Flutter/Dart deprecated. Cek dengan `melos analyze`.
- **No Experimental Code** — tidak ada `@experimental` API di production code.
- **No Circular Dependency** — patuhi: `feature_*` → `domain/data` → `core`. Tidak ada referensi balik.
- **No Injection Duplication** — setiap class hanya diregister satu kali di `packages/di`.
- **Thread Safe** — akses storage hanya melalui abstraksi `packages/local`.
- **Safe Navigation** — semua navigasi via `go_router` (`context.go()` / `context.push()`). Tidak ada `Navigator.of(context)` langsung.
- **Clean Code + SOLID** — setiap class memiliki satu tanggung jawab; abstraksi via repository interface di `packages/domain`.

### Reusable Components
- Widget dipakai di 2+ feature → `packages/components`.
- Widget utility/helper yang bukan design system → `packages/shared_widgets`.
- Jangan duplikasi widget yang sudah ada di packages tersebut.
