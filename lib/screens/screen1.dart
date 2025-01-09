import 'package:clases2/api/api.dart';
import 'package:flutter/material.dart';
import 'package:clases2/provider/user-model.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch JSON Example'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Display the list of users
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else {
              return Text('No data');
            }
          },
        ),
      ),
    );
  }
}
