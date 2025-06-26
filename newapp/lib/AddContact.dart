import 'package:flutter/material.dart';
import 'package:newapp/BottomNavBar.dart';
import 'package:newapp/database_helper.dart';
import 'package:newapp/custom_bottom_nav_bar.dart'; // Import the custom nav bar
import 'package:firebase_database/firebase_database.dart';

class AddDetails extends StatefulWidget {
  final int initialIndex;
  final String? contactKey;
  final String? name;
  final String? number;
  final String? relation;

  const AddDetails({
    Key? key,
    this.initialIndex = 0,
    this.contactKey,
    this.name,
    this.number,
    this.relation,
  }) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController relationController = TextEditingController();
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    if (widget.name != null) nameController.text = widget.name!;
    if (widget.number != null) numberController.text = widget.number!;
    if (widget.relation != null) relationController.text = widget.relation!;
  }

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    // Handle navigation based on your app structure
    // This example assumes you have a MyHomePage that manages the main screens
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(initialIndex: index)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    relationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE7D2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEE7D2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Contact",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: "Full Name",
              hint: "Exp: Muhammad Ahmad",
              controller: nameController,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Contact Number",
              hint: "Exp: 03000000000",
              controller: numberController,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              label: "Relation",
              hint: "Exp: Friend",
              controller: relationController,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (widget.contactKey != null) {
                      final DatabaseReference ref = FirebaseDatabase.instance
                          .ref()
                          .child('contacts');
                      await ref.child(widget.contactKey!).remove();

                      Navigator.pop(context); // Go back after delete
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(120, 50),
                  ),
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final number = numberController.text.trim();
                    final relation = relationController.text.trim();

                    if (name.isNotEmpty &&
                        number.isNotEmpty &&
                        relation.isNotEmpty) {
                      // Get a reference to "contacts" in RTDB:
                      final contactData = {
                        'name': name,
                        'number': number,
                        'relation': relation,
                      };

                      final DatabaseReference ref = FirebaseDatabase.instance
                          .ref()
                          .child('contacts');

                      if (widget.contactKey == null) {
                        // Create new contact
                        await ref.push().set(contactData);
                      } else {
                        // Update existing contact
                        await ref.child(widget.contactKey!).set(contactData);
                      }

                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Success'),
                              content: const Text('Saved Successfully!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // close dialog
                                    Navigator.pop(context); // go back
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(120, 50),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
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

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
