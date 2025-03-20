https://github.com/google/mono_repo.dart

# Fetch all packages
```bash
mono_repo pub get
```

# Run all tests
```bash
mono_repo dart test
```

# Generate code
```bash
mono_repo dart run build_runner build --delete-conflicting-outputs
```