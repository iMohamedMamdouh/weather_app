import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "partly cloudy":
    case "overcast":
    case "cloudy":
    case "patchy sleet possible":
    case "light sleet":
    case "light sleet showers":
      return Colors.blueGrey;
    case "moderate rain at times":
    case "moderate rain":
    case "moderate or heavy rain shower":
    case "mist":
    case "fog":
    case "patchy rain possible":
    case "light drizzle":
    case "patchy light drizzle":
    case "patchy light rain":
    case "light rain":
    case "light rain shower":
    case "patchy snow possible":
    case "light snow":
    case "patchy light snow":
    case "light snow showers":
      return Colors.lightBlue;
    case "patchy freezing drizzle possible":
    case "freezing drizzle":
    case "light freezing rain":
    case "ice pellets":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
    case "freezing fog":
    case "heavy freezing drizzle":
    case "moderate or heavy freezing rain":
      return Colors.cyan;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;
    case "heavy rain at times":
    case "heavy rain":
    case "torrential rain shower":
      return Colors.blue;
    case "moderate or heavy sleet":
    case "moderate or heavy sleet showers":
      return Colors.blueGrey;
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "moderate or heavy snow showers":
    case "blowing snow":
    case "blizzard":
      return Colors.indigo;
    default:
      return Colors.blueGrey; // Default color if condition is not found
  }
}
