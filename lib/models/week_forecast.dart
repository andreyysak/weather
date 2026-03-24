import 'package:intl/intl.dart';

import 'common/weather_common.dart';

class WeekForecast {
  final String date;
  final WeatherMainData main;
  final WeatherDescription weather;

  WeekForecast({
    required this.date,
    required this.main,
    required this.weather,
  });

  String get dayName => DateFormat('EEEE').format(DateTime.parse(date));
  String get shortDate => DateFormat('dd.MM').format(DateTime.parse(date));
  String get time => DateFormat('Hm').format(DateTime.parse(date));

  factory WeekForecast.fromJson(Map<String, dynamic> json) {
    return WeekForecast(
      date: json['dt_txt'] ?? '',
      main: WeatherMainData.fromJson(json['main']),
      weather: WeatherDescription.fromJson(json['weather'][0]),
    );
  }
}