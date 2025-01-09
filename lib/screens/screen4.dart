import 'package:clases2/provider/usersdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:clases2/provider/productdatamodel.dart';
import 'package:clases2/provider/character-model.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Zapatos',
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 52, 184, 87),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ProductDataModel>;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 210,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: items.map((item) {
                                return _buildServiceCard(
                                  imageUrl: item.imageURL ?? "Sin imagen",
                                  nombre: item.name ?? "Sin nombre",
                                  precio: item.price ?? "Sin precio",
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Personajes',
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 52, 184, 87),
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Character>>(
              future: fetchCharacters(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 280,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: snapshot.data!.map((character) {
                                return _buildCharacterCard(
                                  imageUrl: character.image ?? "Sin imagen",
                                  nombre: character.name ?? "Sin nombre",
                                  status: character.status ?? "Sin precio",
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Usuarios',
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 52, 184, 87),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: ReadJsonDataUser(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<UsersDataModel>;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 210,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: items.map((item) {
                                return _buildUserCard(
                                  imageUrl: item.urlAvatar ?? "Sin imagen",
                                  nombre: item.username ?? "Sin nombre",
                                  email: item.email ?? "Sin precio",
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 28, 181, 23),
                Color.fromARGB(255, 138, 247, 174),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Productos y Personas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ventana');
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  tooltip: 'Buscador',
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ventana');
                  },
                  icon: const Icon(Icons.list),
                  color: Colors.white,
                  tooltip: 'Opciones',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
      {required String imageUrl,
      required String nombre,
      required String precio}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            nombre,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          Text(
            precio,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(
      {required String imageUrl,
      required String nombre,
      required String email}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            nombre,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterCard(
      {required String imageUrl,
      required String nombre,
      required String status}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            width: 16,
            height: 130,
          ),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre: $nombre',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'Estado: $status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('data/productos.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  Future<List<UsersDataModel>> ReadJsonDataUser() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('data/usuarios.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => UsersDataModel.fromJson(e)).toList();
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
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Error loading characters: $e');
    }
  }
}
