import 'package:flutter/material.dart';

class DuolingoUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top bar
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hamburger menu icon
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  // Duolingo logo
                  Image.asset(
                    'assets/images/logo-with-duo.png',
                    height: 25,
                    color: Colors.white,
                  ),
                  // Profile icon
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // Lesson banner
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Colors.green,
              child: Column(
                children: [
                  Text(
                    'Bonjour!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Learn French with bite-sized lessons',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Lesson list
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text('Lesson ${index + 1}'),
                    subtitle: Text('10 XP'),
                    trailing: Icon(Icons.keyboard_arrow_right),
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