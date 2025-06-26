import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newapp/ContactList.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DatabaseReference _contactsRef;

  @override
  void initState() {
    super.initState();
    _contactsRef = FirebaseDatabase.instance.ref("contacts");
  }

  Future<void> _sendPanicSms() async {
    final snapshot = await FirebaseDatabase.instance.ref("contacts").get();
    if (!snapshot.exists) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No contacts to notify.")));
      return;
    }

    final data = snapshot.value as Map<dynamic, dynamic>;
    final numbers =
        data.values
            .map(
              (v) =>
                  (v as Map).containsKey('number') ? v['number'] as String : '',
            )
            .where((num) => num.isNotEmpty)
            .toList();

    if (numbers.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No valid numbers found.")));
      return;
    }

    final uri = Uri(
      scheme: 'sms',
      path: numbers.join(','),
      queryParameters: {'body': "I’m in an emergency. Please help me!"},
    );

    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open SMS app.")));
    }
  }

  Widget _buildOption({
    required String label,
    required String assetPath,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffFF3974), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(assetPath)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFF3974),
                  ),
                ),
              ),
              const Image(image: AssetImage('assets/arrow.png')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Center(
              child: GestureDetector(
                onTap: _sendPanicSms,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF3974),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: const Text(
                    'Panic',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Oleo Script',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            _buildOption(
              label: 'Contact List',
              assetPath: 'assets/contact_icon.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactListScreen(),
                  ),
                );
              },
            ),
            _buildOption(
              label: 'Route Mapping',
              assetPath: 'assets/contact_icon.png',
              onTap: () {
                // TODO: Add route mapping navigation
              },
            ),
            _buildOption(
              label: 'Safety Organizations',
              assetPath: 'assets/contact_icon.png',
              onTap: () {
                // TODO: Add navigation or info dialog
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
