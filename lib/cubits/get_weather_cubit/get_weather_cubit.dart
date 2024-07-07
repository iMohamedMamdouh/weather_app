import 'package:demo_weatherapp/Services/weather_service.dart';
import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:demo_weatherapp/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(DefaultWeatherState());

  late WeatherModel weatherModel;

  getWeather(city) async {
    try {
      weatherModel = await WeatherService(Dio()).getCurrentWeather(city: city);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(
        WeatherFailureState(
          e.toString(),
        ),
      );
    }
  }
}
