import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Modal/Weather_modal.dart';
import 'package:weather_app/Provider/Weather_provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onSubmitted: (value) {
              weatherProviderFalse.ImgFind(value);
            },
            controller: SearchText,
          ),
        ),
        body: FutureBuilder(
          future: Provider.of<WeatherProvider>(context)
              .SearchWeather(weatherProviderTrue.search),
          builder: (context, snapshot) {
            WeatherModal? weatherModal = snapshot.data;
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                    '${weatherModal!.location.name}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${weatherModal!.location.region}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    '${weatherModal!.location.localtime}',
                    style: TextStyle(fontSize: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      weatherProviderTrue.Weather.add(
                        weatherModal.location.name,
                      );
                      weatherProviderTrue.Weather1.add(
                        weatherModal.current.temp_c,
                      );

                      Navigator.of(context).pushNamed('/fav');
                    },
                    icon: Icon(Icons.favorite_border),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

var SearchText = TextEditingController();
