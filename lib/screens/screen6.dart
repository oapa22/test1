import 'dart:async';
import 'package:clases2/provider/character-model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart'; // Importa el paquete 'crypto'

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  late Future<List<Character>> futureCreators;

  @override
  void initState() {
    super.initState();
    futureCreators = fetchCharacters();
  }

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];
        return results.map((e) => Character.fromJson(e)).toList();
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Error loading characters: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: Center(
        child: FutureBuilder<List<Character>>(
          future: futureCreators,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Character character = snapshot.data![index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading:
                          Image.network(character.image, width: 50, height: 50),
                      title: Text(character.name),
                      subtitle: Text(
                          'Gender: ${character.gender}\nStatus: ${character.status}'),
                    ),
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
