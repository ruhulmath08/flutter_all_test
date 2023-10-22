import 'package:flutter/material.dart';
import 'package:flutter_all_test/src/core/routes/routing_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginPageTitle),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return  const Center(
      child: Text(homePageTitle),
    );
  }

}
