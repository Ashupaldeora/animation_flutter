import 'package:animator/hero_widget/view/detail_page.dart';
import 'package:animator/hero_widget/view/screen.dart';
import 'package:animator/pages/home/homepage.dart';
import 'package:animator/pages/home/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => GameProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/hero',
      routes: {
        '/': (context) => HomePage(),
        '/hero': (context) => HeroWidgetScreen(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
