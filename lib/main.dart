import 'package:flutter/material.dart';
import 'package:my_app/pages/dashboard.dart';
import 'package:my_app/pages/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/dashboard": (context) => const Dashboard(),
        "/setting": (context) => const Setting()
      },
      home: Dashboard(),
    );
  }
}

