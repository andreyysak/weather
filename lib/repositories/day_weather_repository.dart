import 'package:weather/models/day_forecast.dart';
import 'package:weather/services/day_weather_service.dart';

class DayWeatherRepository {
  final DayWeatherService _dayWeatherService = DayWeatherService();

  Future<List<DayForecast>> getOneDayWeather() async {
    try {
      final forecast = await _dayWeatherService.fetchWeather();

      return forecast;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}