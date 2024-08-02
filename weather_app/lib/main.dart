import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_info.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
          backgroundColor: const Color.fromARGB(117, 151, 193, 239),
          toolbarHeight: 50,
        ),
        body: Container(
          width: 500,
          height: 820,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                  color: Colors.transparent, border: Border.symmetric()),
              child: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CurrentWeatherInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
