import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web1_app/screens/home.dart';
import 'package:web1_app/screens/login.dart';

class _AuthenticatedControllState extends StatefulWidget {
  const _AuthenticatedControllState({super.key});

  @override
  State<_AuthenticatedControllState> createState() => _AuthenticatedControllStateState();
}

class _AuthenticatedControllStateState extends State<_AuthenticatedControllState> {

  @override
  void initState() {
    super.initState();

    verifyToken().then((value) {
      if (value) {
        Navigator.pushReplacement(context, 
          MaterialPageRoute(
            builder: (context) => Home()
          )
        );
      } else {
        Navigator.pushReplacement(context, 
          MaterialPageRoute(
            // builder: (context) => LoginPage()
            builder: (context) => const Login()
          ) 
        );
      }
    });
  }
  
  Future<bool> verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}