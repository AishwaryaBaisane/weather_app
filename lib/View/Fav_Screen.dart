import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/Weather_provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ...List.generate(
              weatherProviderTrue.Weather.length,
              (index) => Column(
                children: [
                  Text('${weatherProviderTrue.Weather[index]}'),
                  Text('${weatherProviderTrue.Weather1[index]}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Text('${weatherProviderTrue.Weather[index]}')
