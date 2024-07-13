### Flutterのプロジェクトを作成
`flutter create --org com.firebaseapp <Firebaseの本番環境のプロジェクトID("-"を"_"に置き換えたもの)>`

### Flavorizrを使って、Flutterのビルドを分ける
`dart run flutter_flavorizr`

### エミュレータにビルド
`flutter run --flavor dev -t lib/main_dev.dart`