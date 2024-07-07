import 'package:demo_weatherapp/models/weather_model.dart';

class WeatherState {}

class DefaultWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMassage;

  WeatherFailureState(this.errorMassage);
}
