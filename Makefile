dev:
	flutter pub run build_runner build --delete-conflicting-outputs

f:
	flutter analyze . && dart format .