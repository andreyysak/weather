import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wb_sunny,
            size: 64,
            color: Colors.orange,
          ),
          const SizedBox(height: 20),
          const Text(
            'Київ',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '25°C',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            'Сонячно',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}