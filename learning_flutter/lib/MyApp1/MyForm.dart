import 'package:flutter/material.dart';
import 'package:logger/logger.dart'; // Import the logger package
import 'package:learning_flutter_coursera/MyApp1/Alert.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final Logger _logger = Logger(); // Initialize the logger
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(Icons.star, color: Colors.blue),
              Icon(Icons.favorite, color: Colors.red),
              Icon(Icons.thumb_up, color: Colors.green),
            ],
          ),
          const Text('Welcome to Flutter!'),
          const Text('Building a layout is easy.'),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter your name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _logger.i(
                  'Form is valid. User input is logged.',
                ); // Log the user input
                showAlertDialog(context, 'Form Submitted', 'User input is logged.');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
