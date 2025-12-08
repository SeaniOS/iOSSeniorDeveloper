import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp5 extends StatefulWidget {
  const MyApp5({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp5> {
  TextEditingController _controller = TextEditingController();
  String _storedValue = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plugin Lab',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Plugins in Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Enter some text'),
              ),
              const SizedBox(height: 16), // Adds space between TextField and Save button
              ElevatedButton(
                onPressed: _saveData,
                child: const Text('Save Data'),
              ),
              const SizedBox(height: 16), // Adds space between Save and Load button
              ElevatedButton(
                onPressed: _loadData,
                child: const Text('Load Data'),
              ),
              const SizedBox(height: 16), // Adds space between Load button and Text
              Text('Stored Value: $_storedValue'),
            ],
          ),
        ),
      ),
    );
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myKey', _controller.text);
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedValue = prefs.getString('myKey') ?? 'No Data';
    });
  }
}