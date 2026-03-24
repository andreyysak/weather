import 'package:flutter/material.dart';
import 'package:weather/models/day_forecast.dart';
import 'package:weather/repositories/day_weather_repository.dart';
import 'package:weather/widgets/day_forecast_card.dart';

class DayForecastScreen extends StatelessWidget {
  DayForecastScreen({super.key});

  final DayWeatherRepository _repository = DayWeatherRepository();

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
      body: FutureBuilder<List<DayForecast>>(
          future: _repository.getOneDayWeather(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
            
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    Text('Error: ${snapshot.error}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight(700),
                      fontSize: 28,
                    ),
                    ),
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
                  return DayForecastCard(item: forecast[index]);
                },
              );
            }
            
            return Center(
              child: Text('No available data'),
            );
          }
      )
    );
  }
}