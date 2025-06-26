import 'package:flutter/material.dart';
import 'package:newapp/Channel.dart';
import 'package:newapp/guide.dart';

import 'package:newapp/location.dart';
import 'package:newapp/mainscreen.dart';
import 'package:newapp/profille2.dart';
import 'package:newapp/setting.dart';
import 'package:newapp/signin.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE5CD),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCE5CD),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.purple,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Muhammad Ahmad',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_6, color: Colors.black),
            title: Text('Themes'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.black),
            title: Text('Help & Support'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => saheli()),
              );
            },
          ),
        ],
      ),
    );
  }
}
