import 'package:flutter/material.dart';
import 'package:hackxite/Screens/chat.dart';
import 'package:hackxite/Screens/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List screen = [HomeScreen(), ChatScreen()];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentScreen],
      bottomNavigationBar: NavigationBar(
        height: 80,
        selectedIndex: currentScreen,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home',selectedIcon: Icon(Icons.home_filled),),
          NavigationDestination(icon: Icon(Icons.message), label: 'Chat',selectedIcon: Icon(Icons.chat_bubble),)
        ],
      ),
    );
  }
}
