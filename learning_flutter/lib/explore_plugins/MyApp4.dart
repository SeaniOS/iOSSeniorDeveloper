import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plugin Lab',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Plugins in Flutter'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _launchURL,
            child: const Text('Open Flutter Website'),
          ),
        ),
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}