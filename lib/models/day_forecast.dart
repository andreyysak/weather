import 'package:intl/intl.dart';

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

  String get fullTime => DateFormat('Hm').format(DateTime.parse(time));

  factory DayForecast.fromJson(Map<String, dynamic> json) {
    return DayForecast(
      time: json['dt_txt'] ?? '',
      main: WeatherMainData.fromJson(json['main']),
      weather: WeatherDescription.fromJson(json['weather'][0]),
      wind: Wind.fromJson(json['wind'])
    );
  }
}