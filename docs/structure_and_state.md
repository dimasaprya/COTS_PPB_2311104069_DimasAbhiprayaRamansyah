# Project Structure & State Management

This document describes the repository layout and gives guidance for state management choices for this Flutter app.

## Observed (recommended) folder structure

From the current workspace (important folders under the repo root):

- `lib/`
  - `main.dart` — app entry point
  - `presentation/`
    - `pages/` — screens (Dashboard, Daftar Resep, Detail, Tambah)
    - `widgets/` — reusable UI widgets
  - `models/` — domain models (e.g., `recipe.dart`)
  - `services/` — small services for data access (e.g., `recipe_service.dart`)
  - `design_system/` — colors, spacing, typography

This structure is suitable for small-to-medium Flutter apps and keeps UI, models, and data/service code separated.

## Contract (for state management choices)

- Inputs: user interactions (add recipe, search, filter), data from local storage or in-memory lists.
- Outputs: UI updates (lists, counts), navigation events, persisted data updates.
- Error modes: invalid input validation, data persistence failure.
- Success criteria: predictable UI updates, testable state, minimal boilerplate.

## Recommended state-management options

1. Provider + ChangeNotifier (simple):
   - Pros: easy to integrate, low boilerplate, good for apps with modest state.
   - When to use: small apps, or if you only need a few ChangeNotifiers (e.g., RecipesListProvider, AddRecipeProvider).

2. Riverpod (recommended for growth):
   - Pros: compile-time safety, testability, scoped providers, and easy refactorability.
   - When to use: if you expect the app to scale, prefer decoupled providers, or want easier unit testing.

3. Bloc (cubit/bloc) (if you need more structure):
   - Pros: explicit events & states, good for complex flows.
   - When to use: complex apps with many asynchronous flows and strict separation.

Given the current code layout (with a small `services/recipe_service.dart`), Provider/ChangeNotifier or Riverpod are both good fits. For quick development, Provider is simplest; for future-proofing and testability, use Riverpod.

## Suggested minimal implementation (Provider example)

- Create `lib/presentation/providers/recipes_provider.dart`:
  - Holds a list of `Recipe` models.
  - Exposes methods: `loadRecipes()`, `addRecipe(Recipe)`, `deleteRecipe(id)`, `filterByCategory(String)`.
  - Use `notifyListeners()` when the list or counts change.

- Wire provider at top-level in `main.dart` using `MultiProvider`.

## Edge cases to handle

- Empty lists (show a friendly empty state)
- Large lists (use lazy ListView, pagination if needed)
- Concurrent edits (prevent double-submit)
- Data validation (title required, category required)

## Testing guidance

- Unit test `recipes_provider.dart` for add/delete/filter behavior.
- Widget tests for `Daftar Resep` list and `Detail Resep` view to ensure UI binds correctly to provider state.

## Next steps / low-risk improvements

- Add `lib/presentation/providers/` and implement a `RecipesProvider`/`RecipesNotifier`.
- Add small unit tests for the provider behavior.
