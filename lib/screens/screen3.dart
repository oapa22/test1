import 'dart:convert';

import 'package:clases2/provider/usersdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lectura de archivos JSON'),
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<UsersDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image(
                                image: NetworkImage(
                                    items[index].urlAvatar.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 8),
                                    child: Text(
                                      items[index].username.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 8),
                                    child: Text(
                                      items[index].email.toString(),
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<UsersDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('data/usuarios.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => UsersDataModel.fromJson(e)).toList();
  }
}
