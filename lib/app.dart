import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flavors.dart';
import 'view/pages/my_home_page/my_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: _flavorBanner(
      //   child: const MyHomePage(),
      //   show: kDebugMode,
      // ),
      home: const MyHomePage(),
    );
  }

  // Widget _flavorBanner({
  //   required Widget child,
  //   bool show = true,
  // }) =>
  //     show
  //         ? Banner(
  //             location: BannerLocation.topStart,
  //             message: F.name,
  //             color: Colors.green.withOpacity(0.6),
  //             textStyle: const TextStyle(
  //                 fontWeight: FontWeight.w700,
  //                 fontSize: 12.0,
  //                 letterSpacing: 1.0),
  //             textDirection: TextDirection.ltr,
  //             child: child,
  //           )
  //         : Container(
  //             child: child,
  //           );
}
