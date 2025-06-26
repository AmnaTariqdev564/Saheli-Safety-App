import 'package:flutter/material.dart';
import 'package:newapp/BottomNavBar.dart';
import 'package:newapp/custom_bottom_nav_bar.dart'; // Import your custom nav bar

class SettingsScreen extends StatefulWidget {
  final int initialIndex; // Add parameter to receive current tab index

  const SettingsScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isVideoAudioSharingEnabled = false;
  bool isNotificationsEnabled = false;
  bool isLocationSharingEnabled = true;
  late int _currentIndex; // Track current tab index

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Initialize with passed value
  }

  // Navigation handler
  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    // Navigate to corresponding page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(initialIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDE7C5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDE7C5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Fixed back button
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingTile(Icons.language, "App Language", true),
            _buildToggleTile(
              Icons.videocam, // Changed icon to better represent video
              "Video & Audio Sharing", // Fixed typo
              isVideoAudioSharingEnabled,
              (value) {
                setState(() {
                  isVideoAudioSharingEnabled = value;
                });
              },
            ),
            _buildToggleTile(
              Icons.notifications,
              "Notifications",
              isNotificationsEnabled,
              (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            _buildToggleTile(
              Icons.location_on,
              "Location Sharing",
              isLocationSharingEnabled,
              (value) {
                setState(() {
                  isLocationSharingEnabled = value;
                });
              },
            ),
            const Divider(),
            _buildSettingTile(Icons.lock, "Change Password", true),
            _buildSettingTile(Icons.share, "Social Accounts", true),
          ],
        ),
      ),
      // Add your custom bottom navigation bar
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

  Widget _buildSettingTile(IconData icon, String title, bool hasNavigation) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          hasNavigation ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
      onTap: () {
        // Add navigation logic here when needed
      },
    );
  }

  Widget _buildToggleTile(
    IconData icon,
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.pink, // Changed to match your theme
        activeTrackColor: Colors.pink.shade200,
      ),
    );
  }
}
