import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/current_forecast.dart';

class CurrentWeatherService {
  final String baseUrl = 'http://8.211.44.164.nip.io/weather/2/current';

 Future<CurrentForecast> fetchWeather() async {
   final response = await http.get(
     Uri.parse(baseUrl)
   );

   if (response.statusCode == 200) {
     return CurrentForecast.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
   } else {
     throw Exception('Failed to load weather');
   }
 }
}