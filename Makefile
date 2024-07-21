dev:
	flutter run --flavor dev -t lib/main_dev.dart

generate:
	flutter pub run build_runner build --delete-conflicting-outputs

f:
	flutter analyze . && dart format .