import 'common/weather_common.dart';

class WeekForecast {
  final String day;
  final String date;
  final WeatherMainData main;
  final WeatherDescription weather;

  WeekForecast({
    required this.day,
    required this.date,
    required this.main,
    required this.weather,
  });
}