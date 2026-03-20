import 'package:flutter/material.dart';
import 'package:weather/models/common/weather_common.dart';
import 'package:weather/models/week_forecast.dart';
import 'package:weather/widgets/week_forecast_card.dart';

class WeekForecastScreen extends StatelessWidget {
  WeekForecastScreen({super.key});

  final List<WeekForecast> forecastData = [
    WeekForecast(
      day: 'Monday',
      date: 'Oct 20',
      main: WeatherMainData(temp: 15, feelsLike: 14, tempMin: 12, tempMax: 18, pressure: 1012, humidity: 60),
      weather: WeatherDescription(main: 'Clouds', description: 'broken clouds', icon: '04d'),
    ),
    WeekForecast(
      day: 'Tuesday',
      date: 'Oct 21',
      main: WeatherMainData(temp: 13, feelsLike: 12, tempMin: 10, tempMax: 15, pressure: 1013, humidity: 65),
      weather: WeatherDescription(main: 'Rain', description: 'light rain', icon: '10d'),
    ),
    WeekForecast(
      day: 'Wednesday',
      date: 'Oct 22',
      main: WeatherMainData(temp: 11, feelsLike: 10, tempMin: 9, tempMax: 14, pressure: 1015, humidity: 70),
      weather: WeatherDescription(main: 'Clear', description: 'clear sky', icon: '01d'),
    ),
    WeekForecast(
      day: 'Thursday',
      date: 'Oct 23',
      main: WeatherMainData(temp: 14, feelsLike: 13, tempMin: 11, tempMax: 17, pressure: 1014, humidity: 55),
      weather: WeatherDescription(main: 'Clouds', description: 'few clouds', icon: '02d'),
    ),
    WeekForecast(
      day: 'Friday',
      date: 'Oct 24',
      main: WeatherMainData(temp: 17, feelsLike: 16, tempMin: 13, tempMax: 20, pressure: 1012, humidity: 50),
      weather: WeatherDescription(main: 'Clear', description: 'sunny', icon: '01d'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const title = 'Five days weather forecast';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
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