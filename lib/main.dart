import 'package:deskartes/view/quadratic_function/quadratic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(4),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0.4),
          ),
        ),
      ),
      home: const QuadraticScreen(),
    );
  }
}
