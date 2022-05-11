// Copyright (c) 2022, Md. Siam
// http://mdsiam.xyz/
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://choosealicense.com/licenses/mit/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/home_page.dart';

void main() {
  // For disabling landscape view
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easybank Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Public_Sans',
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
