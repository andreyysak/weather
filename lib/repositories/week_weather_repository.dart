import 'package:weather/models/week_forecast.dart';
import 'package:weather/services/week_weather_service.dart';

class WeekWeatherRepository {
  final WeekWeatherService _weatherService = WeekWeatherService();

  Future<List<WeekForecast>> getWeekForecast() async {
    try {
      final forecast = await _weatherService.fetchWeather();

      return forecast;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}