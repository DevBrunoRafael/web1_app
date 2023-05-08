import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';


class PostService {

  final String _baseUrl = "http://10.0.0.150:8080/posts";

  final _defaultContentType = {
    "Content-Type": "application/json"
  };

  Future<List<Post>> listAll() async {
    
    var response = await http.get(Uri.parse("$_baseUrl/all"));

    if (response.statusCode == 200) {

      List listPosts = jsonDecode(response.body);

      return listPosts.map((dataJson) => Post.fromJson(dataJson))
        .toList();

    } else {

      throw Exception("Erro ao carregar posts");

    }
  }

  Future<Post> create({String? title, String? text}) async {

    var response = await http.post(
      Uri.parse("$_baseUrl/create"),
      headers: _defaultContentType,
      body: jsonEncode({
        "title": title,
        "text": text
      }),
    );

    if (response.statusCode == 201) {
      var bodyJson = jsonDecode(response.body);
      return Post.fromJson(bodyJson);
    } else {
      
      throw Exception("Erro ao criar post");

    }

  }

  Future<Post> update(int id, {String? title, String? text}) async {

    var response = await http.patch(
      Uri.parse("$_baseUrl/update/$id"),
      headers: _defaultContentType,
      body: jsonEncode({
        "title": title,
        "text": text
      }),
    );

    if (response.statusCode == 200) {
      var bodyJson = jsonDecode(response.body);
      return Post.fromJson(bodyJson);
    } else {
      
      throw Exception("Erro ao atualizar post");

    }
  }

  Future<bool> delete(id) async {
    var response = await http.delete(
      Uri.parse("$_baseUrl/delete/$id")
    );
    
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

}