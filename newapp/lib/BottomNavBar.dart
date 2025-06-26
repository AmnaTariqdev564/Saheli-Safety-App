// home.dart

import 'package:flutter/material.dart';
import 'package:newapp/Channel.dart';
import 'package:newapp/guide.dart';
import 'package:newapp/location.dart';
import 'package:newapp/main.dart';
import 'package:newapp/mainscreen.dart';
import 'package:newapp/profile.dart';

class MyHomePage extends StatefulWidget {
  final int initialIndex;

  const MyHomePage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedIndex;

  // your five page-widgets
  final List<Widget> _screens = [
    MainScreen(),
    ChannelsScreen(),
    location(),
    SafetyGuideScreen(),
    ProfileScreen(),
  ];

  // your icon asset paths
  final List<String> _icons = [
    'assets/home.png',
    'assets/grid.png',
    'assets/location.png',
    'assets/book.png',
    'assets/user.png',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // current page
      body: _screens[_selectedIndex],

      // always‑visible bar
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFF3974),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : const Color(0xFFFFECD0),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    _icons[index],
                    width: 24,
                    height: 24,
                    // optional: tint the selected icon
                    color: isSelected ? const Color(0xFFFF3974) : null,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
