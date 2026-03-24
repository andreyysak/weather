class Coordinates {
  final double lat;
  final double lon;

  Coordinates({required this.lat, required this.lon});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
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

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      main: json['main'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
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

  factory WeatherMainData.fromJson(Map<String, dynamic> json) {
    return WeatherMainData(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );
  }
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

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toDouble(),
      gust: json['gust'] != null ? (json['gust'] as num).toDouble() : null,
    );
  }

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