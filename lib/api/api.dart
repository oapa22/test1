import 'dart:convert';

import 'package:clases2/provider/user-model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // Parse the JSON data into a List of maps
    List<dynamic> jsonList = json.decode(response.body);
    // Convert the List of maps into a List of User objects
    return jsonList.map((json) => User.fromJson(json)).toList();
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to load users');
  }
}
