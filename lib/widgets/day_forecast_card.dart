import 'package:flutter/material.dart';
import 'package:weather/models/day_forecast.dart';

class DayForecastCard extends StatelessWidget {
  final DayForecast item;
  const DayForecastCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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