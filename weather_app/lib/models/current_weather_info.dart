import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';


class CurrentWeatherInfo extends StatefulWidget {
  const CurrentWeatherInfo({super.key});

  @override
  createState() {
    return _CurrentWeatherInfoState();
  }
}

class _CurrentWeatherInfoState extends State<CurrentWeatherInfo> {
  // api key
  final _weatherService = WeatherService('b9213b1b17205c3eb41f8fdea760d1c4');
  WeatherModel? _weather;

  // fetch weather
  _fetchWeather() async {
    // get weather for city
    try {
      final weather = await _weatherService.getWeather();
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // init state
  @override
  void initState() {
    super.initState();
    // fetch weather
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(194, 5, 26, 31),
      ),
      child: _weather == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.network(
                  'http://openweathermap.org/img/wn/${_weather!.iconCode}@4x.png',
                  width: 100,
                  height: 100,

                ),
                const SizedBox(height: 20),
                 Align(
                  alignment: Alignment.center,
                   child: Text(
                    '${_weather!.cityName}',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                                   ),
                 ),
                const SizedBox(height: 10),
                Text(
                  '${_weather!.temperature.round()}°C',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${_weather!.mainCondition}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                WeatherInfo(
                  humidity: _weather!.humidity,
                  sealevel: _weather!.sealevel,
                  wind: _weather!.wind,
                  weatherDescription : _weather!.weatherDescription
                ),
              ],
            ),
    );
  }
}
