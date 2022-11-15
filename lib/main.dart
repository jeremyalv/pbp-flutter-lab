/* REFERENCES
1. https://stackoverflow.com/questions/72152176/how-to-put-buttons-on-two-ends-of-screen-in-flutter
2. https://stackoverflow.com/questions/52458555/how-i-can-view-floatingactionbutton-on-condition
 */

import 'package:flutter/material.dart';
import 'models/budget_item.dart';
import 'pages/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Budget> budgets = <Budget>[];

    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Counter(
        title: 'Counter',
        budgetData: budgets,
      ),
    );
  }
}
