import 'package:clases2/provider/creator-model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  late Future<List<Creator>> futureCreators;

  @override
  void initState() {
    super.initState();
    futureCreators = fetchCreators();
  }

  Future<List<Creator>> fetchCreators() async {
    const String url =
        'https://gateway.marvel.com/v1/public/creators'; // URL de la API
    const String apiKey = 'tu_api_key_aqui'; // Reemplaza con tu API Key

    final response = await http.get(Uri.parse('$url?apikey=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> creatorsJson = jsonData['data']['results'];
      return creatorsJson
          .map((creatorJson) => Creator.fromJson(creatorJson))
          .toList();
    } else {
      throw Exception('Failed to load creators');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel Creators'),
      ),
      body: Center(
        child: FutureBuilder<List<Creator>>(
          future: futureCreators,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Creator creator = snapshot.data![index];
                  return ListTile(
                    title: Text(creator.fullName),
                    subtitle: Text('${creator.firstName} ${creator.lastName}'),
                  );
                },
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
