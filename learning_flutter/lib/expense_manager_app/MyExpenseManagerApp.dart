import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'provider/ExpenseProvider.dart';
import 'screens/CategoryManagementScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/TagManagementScreen.dart';

class MyExpenseManagerApp extends StatelessWidget {
  final LocalStorage localStorage;

  const MyExpenseManagerApp({Key? key, required this.localStorage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider(localStorage)),
      ],
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(), // Main entry point, HomeScreen
          '/manage_categories': (context) =>
              CategoryManagementScreen(), // Route for managing categories
          '/manage_tags': (context) =>
              TagManagementScreen(), // Route for managing tags
        },
        // Removed 'home:' since 'initialRoute' is used to define the home route
      ),
    );
  }
}