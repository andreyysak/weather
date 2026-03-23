import 'package:flutter/material.dart';
import 'package:weather/models/common/weather_common.dart';
import 'package:weather/models/current_forecast.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<CurrentForecast> mockForecasts = [
    CurrentForecast(
      name: 'Kyiv',
      timezone: 7200,
      coords: Coordinates(
        lat: 50.4501,
        lon: 30.5234,
      ),
      weather: WeatherDescription(
        main: 'Clear',
        description: 'clear sky',
        icon: '01d',
      ),
      main: WeatherMainData(
        temp: 20.5,
        feelsLike: 19.8,
        tempMin: 18.0,
        tempMax: 22.0,
        pressure: 1013,
        humidity: 45,
      ),
      wind: Wind(
        speed: 4.1,
        deg: 150,
      ),
      sys: Sys(
        country: 'UA',
        sunrise: 1711167600,
        sunset: 1711211400,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final weather = mockForecasts[0];

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
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
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDetailItem('Humidity', '${weather.main.humidity}%', Icons.water_drop),
                      _buildDetailItem('Pressure', '${weather.main.pressure}', Icons.compress),
                      _buildDetailItem('Wind', '${weather.wind.speed} m/s', Icons.air),
                    ],
                  ),
                  const Divider(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDetailItem('Min', '${weather.main.tempMin}°', Icons.arrow_downward),
                      _buildDetailItem('Max', '${weather.main.tempMax}°', Icons.arrow_upward),
                      _buildDetailItem('Country', weather.sys.country, Icons.location_on),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 28),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}