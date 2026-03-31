import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/time_entry_provider.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  // final LocalStorage localStorage;

  // const MyApp({Key? key, required this.localStorage}) : super(key: key);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the MaterialApp with the ChangeNotifierProvider
    return ChangeNotifierProvider<TimeEntryProvider>(
      // create: (_) => StudentProvider(storage: localStorage),
      create: (_) => TimeEntryProvider(),
      child: MaterialApp(
        title: 'Student Management App',
        home: HomeScreen(),
      ),
    );
  }
}