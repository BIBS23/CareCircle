import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackxite/Screens/bottom_nav.dart';
import 'package:hackxite/Screens/home.dart';
import 'package:hackxite/Screens/login.dart';
import 'package:hackxite/controller/access_storage.dart';
import 'package:hackxite/controller/add_to_chat.dart';
import 'package:hackxite/controller/adduser.dart';
import 'package:hackxite/controller/chatroom_controller.dart';
import 'package:hackxite/controller/login.dart';
import 'package:hackxite/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggin = false;

  checkState() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(
          () {
            isLoggin = true;
          },
        );
      } else {
        setState(
          () {
            isLoggin = false;
          },
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/home': (context) => const HomeScreen(),
        '/signout': (context) => const LoginPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggin ? const BottomNav() : const LoginPage(),
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            AuthController(),
          );
          Get.put(
            AddUserData(),
          );
          Get.put(
            AddChat(),
          );
           Get.put(
           ChatRoomController()
          );
           Get.put(
           AccessStorage()
          );
        },
      ),
    );
  }
}
