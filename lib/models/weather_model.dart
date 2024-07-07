class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String? image;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    this.image,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      tempMax: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      tempMin: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
