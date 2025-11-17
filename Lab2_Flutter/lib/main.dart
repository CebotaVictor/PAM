import 'package:flutter/material.dart';
import 'package:lab2/pages/details_page.dart';
// import 'package:lab2/pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      home: const DetailsPage(title: 'Flutter Demo Home Page'),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
