import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {

    final String _baseUrl = "http://10.0.0.150:8080/auth";

  final _defaultContentType = {
    "Content-Type": "application/json"
  };

  Future<bool> login({email = String, password = String}) async {
    
    var response = await http.post(
      Uri.parse("$_baseUrl/login"),
      headers: _defaultContentType,
      body: jsonEncode({
        "email": email,
        "password": password
      })
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register({name = String, email = String, password = String}) async {

    var response = await http.post(
      Uri.parse("$_baseUrl/register"), 
      headers: _defaultContentType,
      body: jsonEncode({
        'name': name,
        'email' : email,
        'password' : password
      })
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


}