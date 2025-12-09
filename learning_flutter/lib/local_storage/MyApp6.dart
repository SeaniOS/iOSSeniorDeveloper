import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomeScreen6.dart';
import 'StudentProvider.dart';

class MyApp6 extends StatelessWidget {
  final LocalStorage localStorage;
  const MyApp6({Key? key, required this.localStorage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Wrap the MaterialApp with the ChangeNotifierProvider
    return ChangeNotifierProvider<StudentProvider>(
      create: (_) => StudentProvider(storage: localStorage),
      child: MaterialApp(
        title: 'Student Management App',
        home: HomeScreen(), // Assuming HomeScreen leads to EditStudentScreen
      ),
    );
  }
}