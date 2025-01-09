import 'package:clases2/screens/screen4.dart';
import 'package:clases2/screens/screen5.dart';
import 'package:clases2/screens/screen6.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:clases2/screens/screen1.dart';
import 'package:clases2/screens/screen2.dart';
import 'package:clases2/screens/screen3.dart';

class MainScreen3 extends StatefulWidget {
  const MainScreen3({super.key});

  @override
  State<MainScreen3> createState() => _MainScreen3State();
}

class _MainScreen3State extends State<MainScreen3> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      confineToSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style3,
    );
  }

  List<Widget> _buildScreens() {
    return const [
      // Screen6(),
      Screen4(
        title: '',
      ),
      Screen1(),
      Screen3(),
      Screen5(),
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
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.card_giftcard),
        title: 'Card',
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
