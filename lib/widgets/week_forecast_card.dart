import 'package:flutter/material.dart';
import 'package:weather/models/week_forecast.dart';

class WeekForecastCard extends StatelessWidget {
  final WeatherForecast item;
  const WeekForecastCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
      return Card(
      child: ListTile(
        leading: const Icon(Icons.wb_cloudy, color: Colors.blue),
        title: Text('${item.day}, ${item.date}'),
        subtitle: Text('Min: ${item.minTemp}°C'),
        trailing: Text(
          '${item.maxTemp}°C',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}