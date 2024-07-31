import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/Weather_provider.dart';
import 'package:weather_app/View/Fav_Screen.dart';
import 'package:weather_app/View/WeatherPage.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:
        {
          '/': (context)=>WeatherPage(),
          '/fav': (context)=>FavScreen(),
        },
      ),
    );
  }
}
