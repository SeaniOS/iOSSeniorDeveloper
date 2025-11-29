import 'package:flutter/material.dart';
import 'MyForm.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// The context parameter provides information about the location of this widget in the widget tree.
  Widget build(BuildContext context) {
    return MaterialApp(
      /// website tab title
      title: 'Flutter Layout Lab',
      home: Scaffold(
        /// app title
        appBar: AppBar(title: const Text('Flutter Layout Example')),
        body: MyForm(),
        /*body: const Column(
          children: const <Widget>[
            Row(
              /// main axis (horizontal)
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const<Widget>[
                Icon(Icons.star, color: Colors.blue),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.thumb_up, color: Colors.green),
              ],
              // Placeholder for children
            ),
            Text('Welcome to Flutter!'),
            Text('Building a layout is easy.'),
          ],
        ),*/
        // Placeholder for body
      ),
    );
  }
}
