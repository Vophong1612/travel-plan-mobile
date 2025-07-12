# Travel Plan Mobile

A Flutter mobile application built with Clean Architecture, BLoC pattern, and modern Flutter practices.

## Architecture

This project follows Clean Architecture principles with the following structure:

```
lib/
├── src/
│   ├── common/          # API endpoints, constants, exceptions, colors, screen sizes, enums
│   ├── data/            # Data layer
│   │   ├── datasource/  # API clients, databases
│   │   ├── model/       # Data models
│   │   └── repository/  # Data repositories
│   ├── domain/          # Business logic layer
│   │   ├── entity/      # Business entities/domain models
│   │   ├── repository/  # Repository interfaces
│   │   └── usecase/     # Business operations
│   ├── presentation/    # UI layer
│   │   ├── bloc/        # BLoC classes
│   │   ├── cubit/       # Cubit classes
│   │   ├── page/        # Flutter pages/screens
│   │   └── widget/      # Reusable UI components
│   └── utilities/       # Helper classes and utilities
├── injection.dart       # Dependency injection setup
└── main.dart           # Entry point
```

## Features

- **Clean Architecture**: Separation of concerns with data, domain, and presentation layers
- **BLoC Pattern**: State management using flutter_bloc
- **Material 3**: Modern Material Design with color seed (#000000 for light, #ffffff for dark)
- **GoRouter**: Declarative routing
- **GetIt**: Dependency injection
- **Retrofit**: Type-safe HTTP client
- **Freezed**: Immutable data classes
- **Dartz**: Functional programming utilities

## Getting Started

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Generate code** (after adding API endpoints or models):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Adding New Features

1. **Create domain entities** in `lib/src/domain/entity/`
2. **Define repository interfaces** in `lib/src/domain/repository/`
3. **Create use cases** in `lib/src/domain/usecase/`
4. **Implement data models** in `lib/src/data/model/`
5. **Add API endpoints** in `lib/src/common/api_endpoints.dart`
6. **Create BLoCs** in `lib/src/presentation/bloc/`
7. **Build UI pages** in `lib/src/presentation/page/`
8. **Register dependencies** in `lib/injection.dart`

## Dependencies

- `flutter_bloc`: State management
- `get_it`: Dependency injection
- `go_router`: Navigation
- `retrofit`: API client
- `dio`: HTTP client
- `freezed`: Immutable classes
- `json_annotation`: JSON serialization
- `dartz`: Functional programming
- `logger`: Logging utility

## Platforms

- Android
- iOS
