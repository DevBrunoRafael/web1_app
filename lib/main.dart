import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web1_app/constants/colors.dart';
import 'package:web1_app/screens/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme
          .fromSwatch()
          .copyWith(secondary: titleText), // altere a cor aqui
      ),
      title: 'Flutter blog',
      home: const Login(),
    );
  }
}
