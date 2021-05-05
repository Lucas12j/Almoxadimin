import 'package:flutter/material.dart';
import 'package:teste_login/pages/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Almoxadmin',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}
