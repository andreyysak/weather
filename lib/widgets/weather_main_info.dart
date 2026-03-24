import 'package:flutter/material.dart';
import 'package:weather/models/current_forecast.dart';

class WeatherMainInfo extends StatelessWidget {
  final CurrentForecast weather;

  const WeatherMainInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
          const SizedBox(height: 10),
          Text(
            weather.name,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            '${weather.main.temp.round()}°C',
            style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w200),
          ),
          Text(
            weather.weather.description.toUpperCase(),
            style: const TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}