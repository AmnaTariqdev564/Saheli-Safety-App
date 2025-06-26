import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:newapp/AddContact.dart';
import 'package:newapp/BottomNavBar.dart';
import 'package:newapp/custom_bottom_nav_bar.dart';

class ContactListScreen extends StatefulWidget {
  final int initialIndex;
  const ContactListScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  late int _selectedIndex;
  late DatabaseReference _contactsRef;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _contactsRef = FirebaseDatabase.instance.ref("contacts");
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(initialIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // 1) StreamBuilder listens to changes under "contacts"
      body: StreamBuilder<DatabaseEvent>(
        stream: _contactsRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data!.snapshot.value;
          if (data == null) {
            return const Center(child: Text('No contacts found.'));
          }

          // 2) Convert the data into a list of maps
          final Map<dynamic, dynamic> map = data as Map<dynamic, dynamic>;
          final contacts =
              map.entries.map((entry) {
                final v = entry.value as Map<dynamic, dynamic>;
                return {
                  'key': entry.key as String,
                  'name': v['name'] as String? ?? '',
                  'number': v['number'] as String? ?? '',
                  'relation': v['relation'] as String? ?? '',
                };
              }).toList();

          // 3) Build the ListView from contacts
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, i) {
              final contact = contacts[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AddDetails(
                            contactKey: contact['key'],
                            name: contact['name'],
                            number: contact['number'],
                            relation: contact['relation'],
                            initialIndex: _selectedIndex,
                          ),
                    ),
                  );
                },
                child: ContactCard(
                  name: contact['name']!,
                  relation: contact['relation']!,
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade300,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDetails(initialIndex: _selectedIndex),
            ),
          );
        },
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
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

class ContactCard extends StatelessWidget {
  final String name;
  final String relation;

  const ContactCard({Key? key, required this.name, required this.relation})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.pink.shade300),
        ),
        child: ListTile(
          leading: Icon(Icons.group, color: Colors.pink.shade300),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade300,
            ),
          ),
          subtitle: Text(
            relation,
            style: const TextStyle(color: Colors.black54),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
      ),
    );
  }
}
