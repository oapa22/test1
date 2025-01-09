import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:clases2/screens/screen1.dart';
import 'package:clases2/screens/screen2.dart';
import 'package:clases2/screens/screen3.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineToSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 225, 208, 251),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style9,
    );
  }

  List<Widget> _buildScreens() {
    return const [
      Screen1(),
      Screen2(),
      Screen3(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.accessible),
        title: 'Maps',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.window),
        title: 'Productos',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'Usuarios',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
