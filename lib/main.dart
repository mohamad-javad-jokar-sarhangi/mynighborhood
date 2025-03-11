import 'package:flutter/material.dart';
import 'package:mynighborhood/dependency_injection.dart';
import 'package:mynighborhood/presentionlayer/sinin.dart'; 

void main() {
  setupDependencies(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(), 
    );
  }
}
