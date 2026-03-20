class DayForecastMain {
  final int temp;
  final int feelsLike;
  final int tempMin;
  final int tempMax;
  final int pressure;
  final int humidity;

  DayForecastMain({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
}

class DayForecastWeather {
  final String main;
  final String description;
  final String icon;

  DayForecastWeather({
    required this.main,
    required this.description,
    required this.icon,
  });
}

class DayForecastWind {
  final double speed;
  final double deg;
  final double gust;

  DayForecastWind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  String getWindDirection() {
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

class DayForecast {
  final String time;
  final DayForecastMain main;
  final DayForecastWeather weather;
  final DayForecastWind wind;

  DayForecast({
    required this.time,
    required this.main,
    required this.weather,
    required this.wind,
  });
}