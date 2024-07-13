### Flutterのプロジェクトを作成
`flutter create --org com.firebaseapp [Firebaseの本番環境のプロジェクトID("-"を"_"に置き換えたもの)]`

### Flavorizrを使って、Flutterのビルドを分ける
`dart run flutter_flavorizr`

### エミュレータにビルド
`flutter run --flavor dev -t lib/main_dev.dart`

### Firebase Optionファイルの生成
`flutterfire configure --out lib/gen/firebase_options_dev.dart --no-apply-gradle-plugins --platforms=android,ios --ios-bundle-id=[BUNDLE ID] --android-package-name=[ANDROID PACKAGE NAME]`
`[BUNDLE ID] = com.firebaseapp.firSampleTool`
`[ANDROID PACKAGE NAME] = com.firebaseapp.fir_sample_tool`

### Lint
`flutter analyze .`

### Generator
`flutter pub run build_runner build --delete-conflicting-outputs`