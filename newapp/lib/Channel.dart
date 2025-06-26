import 'package:flutter/material.dart';
import 'package:newapp/guide.dart';
import 'package:newapp/location.dart';
import 'package:newapp/mainscreen.dart';
import 'package:newapp/profile.dart';

class ChannelsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> channels = [
    {
      'title': 'Women at Work',
      'emoji': '👩🏿‍💻',
      'online': 56,
      'total': 3429,
      'users': [
        {
          'name': 'Jenny',
          'message': 'Yeah, I have been thinking about it for a long time...',
        },
        {'name': 'Lina', 'message': 'Hey girls, Wassup!!'},
      ],
    },
    {
      'title': 'School Girls',
      'emoji': '🏫',
      'online': 38,
      'total': 1856,
      'users': [
        {
          'name': 'Joanne',
          'message': 'Yeah, I have been thinking about it for a long time...',
        },
        {'name': 'Myle', 'message': 'Hey girls, Wassup!!'},
      ],
    },
    {
      'title': 'Homemakers',
      'emoji': '🏡',
      'online': 75,
      'total': 2951,
      'users': [
        {
          'name': 'Sofie',
          'message': 'Yeah, I have been thinking about it for a long time...',
        },
        {'name': 'Eliza', 'message': 'Hey girls, Wassup!!'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4E7),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Channels',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  final channel = channels[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.pinkAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${channel['title']} ${channel['emoji']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '🟢 ${channel['online']}/${channel['total']} online',
                            style: TextStyle(color: Colors.black87),
                          ),
                          SizedBox(height: 10),
                          ...channel['users'].map<Widget>(
                            (user) => Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                children: [
                                  Text(
                                    '${user['name']}: ',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      user['message'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
