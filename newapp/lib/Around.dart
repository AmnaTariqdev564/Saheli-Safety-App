import 'package:flutter/material.dart';



class SaheliHomePage extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'name': 'Jennifer Lydia', 'address': 'Wild West Street, New York'},
    {'name': 'Maddie', 'address': 'Bell Bottom Street, Madison'},
    {'name': 'Lawrence', 'address': 'Caramon Street, Penselvenia'},
    {'name': 'Medona S', 'address': "Baker's Street, London"},
    {'name': 'Christina', 'address': "Schindler's Street, New York"},
    {'name': 'Emilia Chan', 'address': "Royalty Street, New York"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDE9D9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saheli Around You',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.pinkAccent.shade100),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: Icon(Icons.location_on, color: Colors.pink),
                        title: Text(
                          user['name']!,
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(user['address']!),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Grid'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
