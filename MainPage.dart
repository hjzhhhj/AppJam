import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:p_it/pages/main/HomePage.dart';
import 'package:p_it/pages/main/ProfilePage.dart';
import 'package:p_it/pages/main/RecipePage.dart';
import 'package:p_it/pages/main/SavePage.dart';
import 'package:p_it/widgets/MyBottomNavigationBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final pages = [
    const HomePage(),
    const RecipePage(),
    const SavePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF1F1F1),
        title: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: 39.34,
          height: 23.09,
        ),
        centerTitle: false,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}