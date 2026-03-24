import 'package:flutter/material.dart';
import 'package:weather/models/current_forecast.dart';
import 'package:weather/repositories/current_weather_repository.dart';
import 'package:weather/widgets/weather_detail_card.dart';
import 'package:weather/widgets/weather_main_info.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CurrentWeatherRepository _repository = CurrentWeatherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: FutureBuilder<CurrentForecast>(
          future: _repository.getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text('Помилка: ${snapshot.error}'),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Спробувати знову'),
                    )
                  ],
                ),
              );
            }

            if (snapshot.hasData) {
              final weather = snapshot.data!;

              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: WeatherMainInfo(weather: weather),
                  ),
                  WeatherDetailCard(weather: weather),
                ],
              );
            }

            return const Center(child: Text('Немає даних'));
          },
        ),
      ),
    );
  }
}