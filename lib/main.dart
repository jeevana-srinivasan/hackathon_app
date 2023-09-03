import 'package:flutter/material.dart';

import './page_1.dart';
import './page_2.dart';
import './page_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'page1',
      routes: {
        'page1': (context) => Page1(),
        'page2': (context) => Page2(),
        'page3': (context) => Page3(),
      },
    );
  }
}
