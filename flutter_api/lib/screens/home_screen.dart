import 'package:flutter/material.dart';
import 'package:flutter_api/screens/create_screen.dart';
import 'package:flutter_api/screens/delete_screen.dart';
import 'package:flutter_api/screens/fetch_screen.dart';
import 'package:flutter_api/screens/update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('FLUTTER API x NODE'))),

      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateScreen()),
                );
              },
              child: Text("Create"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FetchScreen()),
                );
              },
              child: Text("Fetch"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateScreen()),
                );
              },
              child: Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteScreen()),
                );
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
