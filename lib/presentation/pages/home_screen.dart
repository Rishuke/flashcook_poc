import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
