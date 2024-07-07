import 'package:demo_weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView1 extends StatelessWidget {
  const SearchView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (cityName) async {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              hintText: 'Enter a city',
              suffixIcon: Icon(Icons.search),
              filled: true,
              contentPadding: EdgeInsets.all(16.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
