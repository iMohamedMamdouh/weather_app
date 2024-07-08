import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:demo_weatherapp/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    weatherModel.image!.contains('https');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background${getThemeImage(weatherModel.weatherCondition)}'),
            fit: BoxFit.cover,
          ),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(-4, -4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              Text(
                '${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${weatherModel.image}",
                  ),
                  Text(
                    '${weatherModel.temp.toString()}°',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'H: ${weatherModel.tempMax.round()}°',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'L: ${weatherModel.tempMin.round()}°',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weatherModel.weatherCondition,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getThemeImage(String image) {
    switch (image.toLowerCase()) {
      case "sunny":
        return 'sunny.jpg';
      case "partly cloudy":
      case "overcast":
      case "cloudy":
      case "patchy sleet possible":
      case "light sleet":
      case "light sleet showers":
        return 'cloudy.jpg';
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
        return 'rain.jpg';
      case "patchy freezing drizzle possible":
      case "freezing drizzle":
      case "light freezing rain":
      case "ice pellets":
      case "light showers of ice pellets":
      case "moderate or heavy showers of ice pellets":
      case "freezing fog":
      case "heavy freezing drizzle":
      case "moderate or heavy freezing rain":
        return 'freezing.jpg';
      case "thundery outbreaks possible":
      case "patchy light rain with thunder":
      case "moderate or heavy rain with thunder":
      case "patchy light snow with thunder":
      case "moderate or heavy snow with thunder":
        return 'thunder.jpg';
      case "heavy rain at times":
      case "heavy rain":
      case "torrential rain shower":
        return 'heavy_rain.jpg';
      case "moderate or heavy sleet":
      case "moderate or heavy sleet showers":
        return 'sleet.jpg';
      case "patchy moderate snow":
      case "moderate snow":
      case "patchy heavy snow":
      case "heavy snow":
      case "moderate or heavy snow showers":
      case "blowing snow":
      case "blizzard":
        return 'snow.jpg';
      default:
        return 'clear.jpg'; // Default color if condition is not found
    }
  }
}
