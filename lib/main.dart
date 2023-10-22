import 'package:flutter/material.dart';
import 'package:flutter_all_test/src/core/routes/router.dart';
import 'package:flutter_all_test/src/core/routes/routing_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: loginPageRoute,
    );
  }
}
