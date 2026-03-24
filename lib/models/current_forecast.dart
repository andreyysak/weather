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

  factory CurrentForecast.fromJson(Map<String, dynamic> json) {
    return CurrentForecast(
      name: json['name'] ?? '',
      timezone: json['timezone'] as int,
      coords: Coordinates.fromJson(json['coord']),
      weather: WeatherDescription.fromJson(json['weather'][0]),
      main: WeatherMainData.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      sys: Sys.fromJson(json['sys']),
    );
  }
}

class Sys {
  final String country;
  final int sunrise;
  final int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'] ?? '',
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    );
  }
}