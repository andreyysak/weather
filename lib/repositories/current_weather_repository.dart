import 'package:weather/models/current_forecast.dart';
import 'package:weather/services/current_weather_service.dart';

class CurrentWeatherRepository {
  final CurrentWeatherService _weatherService = CurrentWeatherService();

  Future<CurrentForecast> getCurrentWeather() async {
    try {
      final weather = await _weatherService.fetchWeather();

      return weather;
    } catch (e) {
      throw Exception('Не вдалося отримати погоду: $e');
    }
  }
}