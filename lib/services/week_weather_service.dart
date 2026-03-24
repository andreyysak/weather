import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/week_forecast.dart';

class WeekWeatherService {
  final String baseUrl = 'http://8.211.44.164.nip.io/weather/2/forecast/5-days';

  Future<List<WeekForecast>> fetchWeather() async {
    final response = await http.get(
      Uri.parse(baseUrl)
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      final List<dynamic> listData = jsonData['list'];

      return listData.map((item) => WeekForecast.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}