import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  double latitude = 0;
  double longitude = 0;

  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather() async {

    LocationPermission permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
    final response = await http
        .get(Uri.parse('$BASE_URL?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric'));

        latitude = position.latitude;
        longitude = position.longitude;
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }



}
