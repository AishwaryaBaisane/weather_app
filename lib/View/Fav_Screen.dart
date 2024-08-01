import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Modal/Weather_modal.dart';
import 'package:weather_app/Provider/Weather_provider.dart';

var index = 0;

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    // final name =
    //     weatherProviderTrue.weather[index].split('-').sublist(0, 1).join('-');
    // final status =
    //     weatherProviderTrue.weather[index].split('-').sublist(1, 2).join('-');
    // final temp =
    //     weatherProviderTrue.weather[index].split('-').sublist(2, 3).join('-');

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black12,
          // backgroundColor: Colors.white,
          body: FutureBuilder(
            future: Provider.of<WeatherProvider>(context).SearchWeather(
              weatherProviderTrue.search,
            ),
            builder: (context, snapshot) {
              WeatherModal? weatherModal = snapshot.data;
              if (snapshot.hasData) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.9,
                      image: AssetImage('assets/img/img9.gif'),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          weatherProviderTrue.weather.length,
                          (index) => Padding(
                              padding: const EdgeInsets.all(7),
                              child: Container(
                                height: 120,
                                width: 380,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white24),
                                child: Center(
                                  child: ListTile(
                                      leading: Image.network(
                                          'http:${weatherProviderTrue.weather3[index]}'),
                                      title: Text(
                                        '${weatherProviderTrue.weather[index]}',
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      subtitle: Text(
                                        '${weatherProviderTrue.weather2[index]}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      trailing: Column(
                                        children: [
                                          Text(
                                            '${weatherProviderTrue.weather1[index]}°c',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )

                                      //
                                      ),
                                ),
                              )),
                          // .asGlass(
                          //                               blurX: 3,
                          //                               blurY: 3,
                          //  glassmorfism kit
                          //   glass kit
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/error.jpg'),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
// Text('${weatherProviderTrue.Weather[index]}')
