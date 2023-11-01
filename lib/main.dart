import 'package:expense_tracker/screen/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(useMaterial3: true),
      home:const Expenses(),
    ),
  );
}