import 'dart:async';
import 'package:fir_sample/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';

import 'gen/firebase_options_dev.dart' as dev;
// import 'gen/firebase_options_prod.dart' as prod;

FutureOr<void> main() async {
  final flavor = F.appFlavor!;
  final options = (flavor == Flavor.dev)
      ? dev.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions
          .currentPlatform; // prod.DefaultFirebaseOptions.currentPlatform
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: options,
  );
  runApp(const App());
}
