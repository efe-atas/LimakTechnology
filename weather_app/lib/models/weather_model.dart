class WeatherModel {
  late final String cityName;
  late final double temperature;
  late final String mainCondition;
  late final String iconCode;
  late final String weatherDescription;
   double humidity = 0;
   double sealevel = 0;
   double wind = 0;

  WeatherModel({
    required this.temperature,
    required this.mainCondition,
    required this.iconCode,
    required this.weatherDescription,
    required this.humidity,
    required this.sealevel,
    required this.wind,
    required this.cityName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      iconCode: json['weather'][0]['icon'],
      weatherDescription: json['weather'][0]['description'],
      humidity: json['main']['humidity'].toDouble(),
      sealevel: json['main']['sea_level'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      cityName : json['name'],
    );
  }
}
