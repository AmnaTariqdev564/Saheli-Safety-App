import 'package:flutter/material.dart';
import 'package:newapp/Channel.dart';
import 'package:newapp/location.dart';
import 'package:newapp/mainscreen.dart';
import 'package:newapp/profile.dart';

class SafetyGuideScreen extends StatelessWidget {
  final List<String> safetyTopics = [
    'Safety at Work',
    'Safety at Home',
    'Safety at University',
    'Women Safety Online',
    'Safety on the Streets',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0D9),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Guide of Safety',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),

            Image.asset('assets/shield.png', width: 60, height: 60),
            SizedBox(height: 20),
            ...safetyTopics.map(
              (topic) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF3D7F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      topic,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
