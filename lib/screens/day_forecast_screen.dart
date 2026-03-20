import 'package:flutter/material.dart';
import 'package:weather/models/common/weather_common.dart';
import 'package:weather/models/day_forecast.dart';
import 'package:weather/widgets/day_forecast_card.dart';

class DayForecastScreen extends StatelessWidget {
  DayForecastScreen({super.key});

  final List<DayForecast> hourlyForecast = [
    DayForecast(
      time: '00:00',
      main: WeatherMainData(temp: 12.0, feelsLike: 11.0, tempMin: 12.0, tempMax: 12.0, pressure: 1015, humidity: 80),
      weather: WeatherDescription(main: 'Clear', description: 'clear sky', icon: '01n'),
      wind: Wind(speed: 2.1, deg: 180, gust: 3.0),
    ),
    DayForecast(
      time: '03:00',
      main: WeatherMainData(temp: 10.0, feelsLike: 9.0, tempMin: 10.0, tempMax: 10.0, pressure: 1015, humidity: 85),
      weather: WeatherDescription(main: 'Clouds', description: 'few clouds', icon: '02n'),
      wind: Wind(speed: 1.8, deg: 190, gust: 2.5),
    ),
    DayForecast(
      time: '06:00',
      main: WeatherMainData(temp: 11.0, feelsLike: 10.0, tempMin: 11.0, tempMax: 11.0, pressure: 1014, humidity: 82),
      weather: WeatherDescription(main: 'Clouds', description: 'scattered clouds', icon: '03n'),
      wind: Wind(speed: 2.5, deg: 200, gust: 4.0),
    ),
    DayForecast(
      time: '09:00',
      main: WeatherMainData(temp: 15.0, feelsLike: 14.0, tempMin: 15.0, tempMax: 15.0, pressure: 1014, humidity: 70),
      weather: WeatherDescription(main: 'Clear', description: 'sunny', icon: '01d'),
      wind: Wind(speed: 3.5, deg: 210, gust: 5.0),
    ),
    DayForecast(
      time: '12:00',
      main: WeatherMainData(temp: 20.0, feelsLike: 19.0, tempMin: 20.0, tempMax: 20.0, pressure: 1013, humidity: 55),
      weather: WeatherDescription(main: 'Clouds', description: 'broken clouds', icon: '04d'),
      wind: Wind(speed: 4.8, deg: 220, gust: 7.5),
    ),
    DayForecast(
      time: '15:00',
      main: WeatherMainData(temp: 22.0, feelsLike: 21.0, tempMin: 22.0, tempMax: 22.0, pressure: 1012, humidity: 50),
      weather: WeatherDescription(main: 'Clouds', description: 'scattered clouds', icon: '03d'),
      wind: Wind(speed: 5.2, deg: 230, gust: 8.0),
    ),
    DayForecast(
      time: '18:00',
      main: WeatherMainData(temp: 19.0, feelsLike: 18.0, tempMin: 19.0, tempMax: 19.0, pressure: 1012, humidity: 60),
      weather: WeatherDescription(main: 'Rain', description: 'light rain', icon: '10d'),
      wind: Wind(speed: 4.0, deg: 240, gust: 6.5),
    ),
    DayForecast(
      time: '21:00',
      main: WeatherMainData(temp: 16.0, feelsLike: 15.0, tempMin: 16.0, tempMax: 16.0, pressure: 1013, humidity: 75),
      weather: WeatherDescription(main: 'Clouds', description: 'overcast clouds', icon: '04n'),
      wind: Wind(speed: 3.0, deg: 250, gust: 4.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '24h Forecast',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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