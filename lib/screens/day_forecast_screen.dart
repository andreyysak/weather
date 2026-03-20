import 'package:flutter/material.dart';
import 'package:weather/models/day_forecast.dart';
import 'package:weather/widgets/day_forecast_card.dart';

class DayForecastScreen extends StatelessWidget {
  DayForecastScreen({super.key});

  final List<DayForecast> hourlyForecast = [
    DayForecast(
      time: '00:00',
      main: DayForecastMain(temp: 12, feelsLike: 11, tempMin: 12, tempMax: 12, pressure: 1015, humidity: 80),
      weather: DayForecastWeather(main: 'Clear', description: 'clear sky', icon: '01n'),
      wind: DayForecastWind(speed: 2.1, deg: 180, gust: 3.0),
    ),
    DayForecast(
      time: '03:00',
      main: DayForecastMain(temp: 10, feelsLike: 9, tempMin: 10, tempMax: 10, pressure: 1015, humidity: 85),
      weather: DayForecastWeather(main: 'Clouds', description: 'few clouds', icon: '02n'),
      wind: DayForecastWind(speed: 1.8, deg: 190, gust: 2.5),
    ),
    DayForecast(
      time: '06:00',
      main: DayForecastMain(temp: 11, feelsLike: 10, tempMin: 11, tempMax: 11, pressure: 1014, humidity: 82),
      weather: DayForecastWeather(main: 'Clouds', description: 'scattered clouds', icon: '03n'),
      wind: DayForecastWind(speed: 2.5, deg: 200, gust: 4.0),
    ),
    DayForecast(
      time: '09:00',
      main: DayForecastMain(temp: 15, feelsLike: 14, tempMin: 15, tempMax: 15, pressure: 1014, humidity: 70),
      weather: DayForecastWeather(main: 'Clear', description: 'sunny', icon: '01d'),
      wind: DayForecastWind(speed: 3.5, deg: 210, gust: 5.0),
    ),
    DayForecast(
      time: '12:00',
      main: DayForecastMain(temp: 20, feelsLike: 19, tempMin: 20, tempMax: 20, pressure: 1013, humidity: 55),
      weather: DayForecastWeather(main: 'Clouds', description: 'broken clouds', icon: '04d'),
      wind: DayForecastWind(speed: 4.8, deg: 220, gust: 7.5),
    ),
    DayForecast(
      time: '15:00',
      main: DayForecastMain(temp: 22, feelsLike: 21, tempMin: 22, tempMax: 22, pressure: 1012, humidity: 50),
      weather: DayForecastWeather(main: 'Clouds', description: 'scattered clouds', icon: '03d'),
      wind: DayForecastWind(speed: 5.2, deg: 230, gust: 8.0),
    ),
    DayForecast(
      time: '18:00',
      main: DayForecastMain(temp: 19, feelsLike: 18, tempMin: 19, tempMax: 19, pressure: 1012, humidity: 60),
      weather: DayForecastWeather(main: 'Rain', description: 'light rain', icon: '10d'),
      wind: DayForecastWind(speed: 4.0, deg: 240, gust: 6.5),
    ),
    DayForecast(
      time: '21:00',
      main: DayForecastMain(temp: 16, feelsLike: 15, tempMin: 16, tempMax: 16, pressure: 1013, humidity: 75),
      weather: DayForecastWeather(main: 'Clouds', description: 'overcast clouds', icon: '04n'),
      wind: DayForecastWind(speed: 3.0, deg: 250, gust: 4.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('24h Forecast', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: hourlyForecast.length,
        itemBuilder: (context, index) {
          return DayForecastCard(item: hourlyForecast[index]);
        },
      ),
    );
  }
}