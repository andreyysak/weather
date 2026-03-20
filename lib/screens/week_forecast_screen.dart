import 'package:flutter/material.dart';
import 'package:weather/models/week_forecast.dart';
import 'package:weather/widgets/week_forecast_card.dart';

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
        title: const Text(title, style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          return WeekForecastCard(item: forecastData[index]);
        },
      ),
    );
  }
}