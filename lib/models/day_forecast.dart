import 'common/weather_common.dart';

class DayForecast {
  final String time;
  final WeatherMainData main;
  final WeatherDescription weather;
  final Wind wind;

  DayForecast({
    required this.time,
    required this.main,
    required this.weather,
    required this.wind,
  });
}