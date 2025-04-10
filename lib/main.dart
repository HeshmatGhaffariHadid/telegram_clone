import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> stories = ['Ahmad', 'Ali', 'MoM', 'Sara', 'Sohail','Sodais','Farzad'];
  final List<String> chats = ['Ahmad', 'Ali', 'MoM', 'Sara', 'Sohail','Sodais','Belal'];
  final List<String> lastMessages = ['Hey, what\'s up?', 'Let\'s catch up soon!', 'Call me when you\'re free.', 'Good morning!', 'Are you coming to the event?','ok, see you', 'Yes tomorrow in the downtown'];
  final List<String> status = ['Online', 'Last seen today', 'Online', 'Last seen 5 hours ago', 'Online','last seen recently','online'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telegram', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Stories Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // Action to add story
                        },
                        child: const Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.add, color: Colors.white, size: 30),
                            ),
                            SizedBox(height: 8),
                            Text('Add Story', style: TextStyle(fontSize: 12, color: Colors.black)),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/default_profile.jpg'), // Default profile image
                          ),
                          SizedBox(height: 8),
                          Text(stories[index - 1], style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),

          // Chats Section
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5.0, // Subtle shadow effect
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/default_profile.jpg'), // Default profile image
                    ),
                    title: Text(
                      chats[index],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.black54, size: 14),
                        SizedBox(width: 5),
                        Text(
                          status[index],
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(lastMessages[index], style: TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                    onTap: () {
                      // Navigate to chat screen (you can add navigation later)
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
