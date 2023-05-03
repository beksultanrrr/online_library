import 'package:online_library/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'library.dart';
import 'chat_screen.dart';

class BottomNavigation extends StatefulWidget {
  static const String id = "bottom_navigation_id";

  const BottomNavigation({Key? key}) : super(key: key);
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Чат',
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.book),
            label: 'Библиотека',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
      body: <Widget>[
        const ChatScreen(),
        Categories(),
        Settings()
      ][currentPageIndex],
    );
  }
}
