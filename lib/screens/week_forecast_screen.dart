import 'package:flutter/material.dart';

class WeatherForecast {
  final String day;
  final String date;
  final int minTemp;
  final int maxTemp;

  WeatherForecast({
    required this.day,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
  });
}

class WeekForecastScreen extends StatelessWidget {
  WeekForecastScreen({super.key});

  final List<WeatherForecast> forecastData = [
    WeatherForecast(day: 'Monday', date: 'Oct 20', minTemp: 12, maxTemp: 18),
    WeatherForecast(day: 'Tuesday', date: 'Oct 21', minTemp: 10, maxTemp: 15),
    WeatherForecast(day: 'Wednesday', date: 'Oct 22', minTemp: 9, maxTemp: 14),
    WeatherForecast(day: 'Thursday', date: 'Oct 23', minTemp: 11, maxTemp: 17),
    WeatherForecast(day: 'Friday', date: 'Oct 24', minTemp: 13, maxTemp: 20),
  ];

  @override
  Widget build(BuildContext context) {
    const title = 'Five days weather forecast';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          final item = forecastData[index];
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
        },
      ),
    );
  }
}