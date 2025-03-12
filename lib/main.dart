import 'package:flutter/material.dart';
import 'package:mynighborhood/dependency_injection.dart';
import 'package:mynighborhood/presentionlayer/pages/sign_up_page.dart';

void main() {
  setupDependencies(); // اجرای تنظیمات وابستگی‌ها
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Neighborhood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
