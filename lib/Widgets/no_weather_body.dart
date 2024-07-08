import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Search for a city',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'to see today\'s weather',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 16),
            Icon(Icons.wb_sunny, size: 50, color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
