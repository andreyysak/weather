import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/day_forecast.dart';

class DayWeatherService {
  final String baseUrl = 'http://8.211.44.164.nip.io/weather/2/forecast/today';

  Future<List<DayForecast>> fetchWeather() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      return jsonData.map((item) => DayForecast.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load weather');
    }
  }
}