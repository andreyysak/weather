import 'package:flutter/material.dart';
import 'package:weather/models/current_forecast.dart';

class WeatherDetailCard extends StatelessWidget {
  final CurrentForecast weather;

  const WeatherDetailCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _DetailItem(label: 'Humidity', value: '${weather.main.humidity}%', icon: Icons.water_drop),
              _DetailItem(label: 'Pressure', value: '${weather.main.pressure}', icon: Icons.compress),
              _DetailItem(label: 'Wind', value: '${weather.wind.speed} m/s', icon: Icons.air),
            ],
          ),
          const Divider(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _DetailItem(label: 'Min', value: '${weather.main.tempMin}°', icon: Icons.arrow_downward),
              _DetailItem(label: 'Max', value: '${weather.main.tempMax}°', icon: Icons.arrow_upward),
              _DetailItem(label: 'Country', value: weather.sys.country, icon: Icons.location_on),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DetailItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 28),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}