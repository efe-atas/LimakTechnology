import 'package:flutter/material.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo(
      {super.key,
      required this.humidity,
      required this.sealevel,
      required this.wind,
      required this.weatherDescription});

  final double humidity;
  final double sealevel;
  final double wind;
  final String weatherDescription;

  @override
  State<StatefulWidget> createState() {
    return _WeatherInfo();
  }
}

class _WeatherInfo extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(194, 2, 0, 0),
      ),
      child: Column(

        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                        '${widget.weatherDescription}',
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage(
                        'lib/assets/images/humidity.png'),
                    height: 40,
                  ),
                  const Text(
                    'Humidity',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  Text(
                    '%${widget.humidity.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage('lib/assets/images/wind.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const Text(
                    'Wind',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  Text(
                    widget.wind.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage(
                        'lib/assets/images/sea_level.png'),
                    height: 40,
                  ),
                  const Text(
                    'Sea Level',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  Text(
                    '${widget.sealevel.toString()} mt',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                ]),
          ),
         
        ],
      ),
    );
  }
}
