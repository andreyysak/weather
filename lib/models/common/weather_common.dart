class Coordinates {
  final double lon;
  final double lat;

  Coordinates({required this.lon, required this.lat});
}

class WeatherDescription {
  final String main;
  final String description;
  final String icon;

  WeatherDescription({
    required this.main,
    required this.description,
    required this.icon,
  });
}

class WeatherMainData {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  WeatherMainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
}

class Wind {
  final double speed;
  final double deg;
  final double? gust;

  Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  String getDirection() {
    if (deg >= 337.5 || deg < 22.5) return 'North';
    if (deg >= 22.5 && deg < 67.5) return 'North-East';
    if (deg >= 67.5 && deg < 112.5) return 'East';
    if (deg >= 112.5 && deg < 157.5) return 'South-East';
    if (deg >= 157.5 && deg < 202.5) return 'South';
    if (deg >= 202.5 && deg < 247.5) return 'South-West';
    if (deg >= 247.5 && deg < 292.5) return 'West';
    if (deg >= 292.5 && deg < 337.5) return 'North-West';
    return 'Unknown';
  }
}