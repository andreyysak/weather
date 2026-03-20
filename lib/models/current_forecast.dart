import 'common/weather_common.dart';

class CurrentForecast {
  final String name;
  final int timezone;
  final Coordinates coords;
  final WeatherDescription weather;
  final WeatherMainData main;
  final Wind wind;
  final Sys sys;

  CurrentForecast({
    required this.name,
    required this.timezone,
    required this.coords,
    required this.weather,
    required this.main,
    required this.wind,
    required this.sys,
  });
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});
}