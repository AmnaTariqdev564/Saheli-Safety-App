import 'package:flutter/material.dart';


class SafetyDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1E6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Safety at Work",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.shield, color: Colors.brown),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/scooter_girl.png', // Replace with actual image asset
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        loremText,
                        style: TextStyle(fontSize: 14, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String loremText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus a pellentesque sit amet porttitor eget dolor morbi non. Pharetra convallis posuere morbi leo urna molestie at elementum eu. Quis vel eros donec ac odio tempor orci dapibus. Purus sit amet luctus venenatis lectus magna fringilla. Vitae et leo duis ut diam quam nulla porttitor massa. Convallis posuere morbi leo urna molestie at elementum. Nulla aliquet enim tortor at auctor urna. Laoreet id donec ultrices tincidunt. Blandit massa enim nec dui nunc.

Et tortor consequat id porta nibh venenatis cras sed felis. Facilisis magna etiam tempor orci eu lobortis elementum nibh tellus. Egestas sed sed risus pretium quam vulputate dignissim suspendisse. Pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat. Lorem sed risus ultricies tristique nulla aliquet enim tortor. Sed libero enim sed faucibus turpis. Eget nunc lobortis mattis aliquam.
''';
