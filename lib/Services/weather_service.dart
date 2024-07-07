import 'dart:developer';

import 'package:demo_weatherapp/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "cb1ac80a732b424280062434240207";
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['error']['massage'] ?? 'oops something went wrong';
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error');
    }
  }

  Future<WeatherModel> getForcast({required String city}) async {
    Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

    WeatherModel weathermodel = WeatherModel.fromJson(response.data);

    return weathermodel;
  }
}
