import 'package:flutter/material.dart';
import 'package:weather/models/week_forecast.dart';
import 'package:weather/repositories/week_weather_repository.dart';
import 'package:weather/widgets/week_forecast_card.dart';

class WeekForecastScreen extends StatelessWidget {
  WeekForecastScreen({super.key});

  final WeekWeatherRepository _repository = WeekWeatherRepository();

  @override
  Widget build(BuildContext context) {
    const title = 'Week weather forecast';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<WeekForecast>>(
        future: _repository.getWeekForecast(),
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
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(onPressed: () {}, child: const Text('Try again!'))
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            final forecast = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                return WeekForecastCard(item: forecast[index]);
              },
            );
          }
          
          return const Center(
            child: Text('No data available'),
          );
        },
      )
    );
  }
}