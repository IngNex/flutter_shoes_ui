import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Shoes',
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
