import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackxite/Screens/add_post.dart';
import 'package:hackxite/Screens/admin_profile.dart';
import 'package:hackxite/Screens/chat.dart';
import 'package:hackxite/Screens/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
    @override
  void initState() {
  
    super.initState();
    _checkAdminStatus();
  }
  bool _isAdmin = false; // Initial assumption

  Future<void> _checkAdminStatus() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    if (userUid == null) return; // Ensure there's a logged-in user

    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userUid).get();
    final userData = doc.data();
    if (userData != null) {
      setState(
        () {
          _isAdmin = userData['admin']?? false;
          print(_isAdmin);
        },
      );
    }
  }

  List screen = [
    const HomeScreen(),
    const ChatScreen(),
    PostImagePage(),
    OldAgeHomeDetailsScreen(
      uid: FirebaseAuth.instance.currentUser!.uid,
    )
  ];
  int currentScreen = 0;

  final destinations = [
    const NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
      selectedIcon: Icon(Icons.home_filled),
    ),
    const NavigationDestination(
      icon: Icon(Icons.message),
      label: 'Chat',
      selectedIcon: Icon(Icons.chat_bubble),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    if (_isAdmin && destinations.length < 3) {
      destinations.add(
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Add post',
          selectedIcon: Icon(Icons.add),
        ),
      );
      destinations.add(
        const NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
          selectedIcon: Icon(Icons.person_2_sharp),
        ),
      );
    }
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
          destinations: destinations),
    );
  }
}
