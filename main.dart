import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_it/pages/MainPage.dart';
import 'package:p_it/pages/main/HomePage.dart';
import 'package:p_it/pages/main/ProfilePage.dart';
import 'package:p_it/pages/main/RecipePage.dart';
import 'package:p_it/pages/main/SavePage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/recipe', page: () => const RecipePage()),
        GetPage(name: '/save', page: () => const SavePage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
        GetPage(name: '/home', page: () => const HomePage())
      ],
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
