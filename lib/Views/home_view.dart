import 'package:demo_weatherapp/Widgets/no_weather_body.dart';
import 'package:demo_weatherapp/Widgets/search_view.dart';
import 'package:demo_weatherapp/Widgets/weather_info_body.dart';
import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        backgroundColor: const Color(0xFF3B7AC1),
        centerTitle: true,
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          const SearchView(),
          BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is DefaultWeatherState) {
                return const NoWeatherBody();
              } else if (state is WeatherLoadedState) {
                return WeatherInfoBody(
                  weather: state.weatherModel,
                );
              } else {
                return const Text(
                  'oops there is an error, try again',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
