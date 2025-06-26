import 'package:flutter/material.dart';
import 'package:newapp/signup.dart';

class saheli extends StatefulWidget {
  const saheli({super.key});

  @override
  State<saheli> createState() => _saheliState();
}

class _saheliState extends State<saheli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Take full width
        height: double.infinity, // Take full height
        color: Color(0xFFFF3974), // Set background color
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Optional: Aligns content
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 200),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 14, color: Colors.white54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFFFF3974),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white54, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Password",
                style: TextStyle(fontSize: 14, color: Colors.white54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Color(0xFFFF3974),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white54, width: 2),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight, // Aligns text to the right
              padding: const EdgeInsets.only(
                right: 20,
                top: 10,
              ), // Add right padding
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Aligns icons in center
                children: [
                  // Google Logo
                  Container(
                    padding: EdgeInsets.all(10), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Color(0xFFFFECD0), // Background color
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Rounded corners
                    ),
                    child: Image.network(
                      'https://img.icons8.com/?size=48&id=17949&format=png', // Facebook logo URL
                      width: 30, // Adjust width
                      height: 30, // Adjust height
                    ),
                  ),
                  SizedBox(width: 10), // Space between logos
                  // facebook Logo
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFECD0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      'https://img.icons8.com/?size=48&id=uLWV5A9vXIPu&format=png', // Facebook logo URL
                      width: 30, // Adjust width
                      height: 30, // Adjust height
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Distributes elements evenly
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "New Here?",
                        style: TextStyle(fontSize: 14, color: Colors.white54),
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signin()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 50,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFECD0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
