import 'package:flutter/material.dart';
import 'package:weather/models/week_forecast.dart';
import 'package:weather/utils/string_extensions.dart';

class WeekForecastCard extends StatelessWidget {
  final WeekForecast item;
  const WeekForecastCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[400],
      child: ListTile(
        leading: Image(
          image: NetworkImage('https://openweathermap.org/payload/api/media/file/${item.weather.icon}.png'),
        ),
        title: Text('${item.dayName}, ${item.shortDate}, ${item.time}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight(700)
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.weather.description.capitalize(),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight(600),
              ),
            ),
            Text('Min: ${item.main.tempMin.toInt()}°C | Max: ${item.main.tempMax.toInt()}°C',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight(600)
              ),
            ),
          ],
        ),
        trailing: Text(
          '${item.main.feelsLike.toInt()}°C',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight(800),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}