import 'package:flutter/material.dart';

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

class DayForecastScreen extends StatelessWidget {
  DayForecastScreen({super.key});

  final List<DayForecast> hourlyForecast = [
    DayForecast(
      time: '00:00',
      main: DayForecastMain(temp: 12, feelsLike: 11, tempMin: 12, tempMax: 12, pressure: 1015, humidity: 80),
      weather: DayForecastWeather(main: 'Clear', description: 'clear sky', icon: '01n'),
      wind: DayForecastWind(speed: 2.1, deg: 180, gust: 3.0),
    ),
    DayForecast(
      time: '03:00',
      main: DayForecastMain(temp: 10, feelsLike: 9, tempMin: 10, tempMax: 10, pressure: 1015, humidity: 85),
      weather: DayForecastWeather(main: 'Clouds', description: 'few clouds', icon: '02n'),
      wind: DayForecastWind(speed: 1.8, deg: 190, gust: 2.5),
    ),
    DayForecast(
      time: '06:00',
      main: DayForecastMain(temp: 11, feelsLike: 10, tempMin: 11, tempMax: 11, pressure: 1014, humidity: 82),
      weather: DayForecastWeather(main: 'Clouds', description: 'scattered clouds', icon: '03n'),
      wind: DayForecastWind(speed: 2.5, deg: 200, gust: 4.0),
    ),
    DayForecast(
      time: '09:00',
      main: DayForecastMain(temp: 15, feelsLike: 14, tempMin: 15, tempMax: 15, pressure: 1014, humidity: 70),
      weather: DayForecastWeather(main: 'Clear', description: 'sunny', icon: '01d'),
      wind: DayForecastWind(speed: 3.5, deg: 210, gust: 5.0),
    ),
    DayForecast(
      time: '12:00',
      main: DayForecastMain(temp: 20, feelsLike: 19, tempMin: 20, tempMax: 20, pressure: 1013, humidity: 55),
      weather: DayForecastWeather(main: 'Clouds', description: 'broken clouds', icon: '04d'),
      wind: DayForecastWind(speed: 4.8, deg: 220, gust: 7.5),
    ),
    DayForecast(
      time: '15:00',
      main: DayForecastMain(temp: 22, feelsLike: 21, tempMin: 22, tempMax: 22, pressure: 1012, humidity: 50),
      weather: DayForecastWeather(main: 'Clouds', description: 'scattered clouds', icon: '03d'),
      wind: DayForecastWind(speed: 5.2, deg: 230, gust: 8.0),
    ),
    DayForecast(
      time: '18:00',
      main: DayForecastMain(temp: 19, feelsLike: 18, tempMin: 19, tempMax: 19, pressure: 1012, humidity: 60),
      weather: DayForecastWeather(main: 'Rain', description: 'light rain', icon: '10d'),
      wind: DayForecastWind(speed: 4.0, deg: 240, gust: 6.5),
    ),
    DayForecast(
      time: '21:00',
      main: DayForecastMain(temp: 16, feelsLike: 15, tempMin: 16, tempMax: 16, pressure: 1013, humidity: 75),
      weather: DayForecastWeather(main: 'Clouds', description: 'overcast clouds', icon: '04n'),
      wind: DayForecastWind(speed: 3.0, deg: 250, gust: 4.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('24h Forecast (3h step)'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: hourlyForecast.length,
        itemBuilder: (context, index) {
          final item = hourlyForecast[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            child: ExpansionTile(
              leading: Text(
                item.time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              title: Text(
                '${item.main.temp}°C - ${item.weather.main}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(item.weather.description),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInfoRow('Feels like', '${item.main.feelsLike}°C'),
                      const Divider(),
                      _buildInfoRow('Wind', '${item.wind.speed} m/s, ${item.wind.getWindDirection()}'),
                      const Divider(),
                      _buildInfoRow('Humidity', '${item.main.humidity}%'),
                      const Divider(),
                      _buildInfoRow('Pressure', '${item.main.pressure} hPa'),
                      const Divider(),
                      _buildInfoRow('Min/Max', '${item.main.tempMin}° / ${item.main.tempMax}°'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}