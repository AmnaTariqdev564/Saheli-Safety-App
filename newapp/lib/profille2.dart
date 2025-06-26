import 'package:flutter/material.dart';
import 'package:newapp/BottomNavBar.dart';
import 'package:newapp/custom_bottom_nav_bar.dart';

import 'package:newapp/guide.dart';
import 'package:newapp/mainscreen.dart';
import 'package:newapp/profile.dart';
import 'package:newapp/signin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 4; // Profile tab index

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(initialIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE9CB),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.purple,
                  backgroundImage: AssetImage('assets/dp.png'),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.edit, size: 14, color: Colors.pink),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      readOnly: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Muhammad Ahmad',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Email', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      readOnly: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'AhmadJaveed@gmail.com',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Pushes content to the top
            Center(
              // Center horizontally
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => saheli()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4C87),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const Spacer(), // Pushes content to the center
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
        icons: const [
          'assets/home.png',
          'assets/grid.png',
          'assets/location.png',
          'assets/book.png',
          'assets/user.png',
        ],
      ),
    );
  }
}
