import 'package:flutter/material.dart';
import 'package:linked_text/linked_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            child: LinkedText(
              text:
                  'Hi!\n[This link](https://example.com) links to the project repo. [This one](https://example2.com) links to another repo.',
              onLinkTap: (url) => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Link tapped'),
                  content: Text(url),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
