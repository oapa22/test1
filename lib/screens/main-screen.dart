import 'package:clases2/screens/screen1.dart';
import 'package:clases2/screens/screen2.dart';
import 'package:clases2/screens/screen3.dart';
import 'package:clases2/screens/screen5.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const Screen1(),
      const Screen2(),
      const Screen3(),
      const Screen5(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible),
              activeIcon: Icon(Icons.accessible_forward),
              label: 'Maps',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.window),
              activeIcon: Icon(Icons.window_outlined),
              label: 'Ventana',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              activeIcon: Icon(Icons.verified_user_outlined),
              label: 'Usuarios',
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
