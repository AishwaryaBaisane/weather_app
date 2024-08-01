import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Modal/Weather_modal.dart';
import 'package:weather_app/Provider/Weather_provider.dart';
import 'package:weather_app/Utils/global.dart';
import 'package:weather_app/View/ListPage.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Provider.of<WeatherProvider>(context).SearchWeather(
            weatherProviderTrue.search,
          ),
          builder: (context, snapshot) {
            WeatherModal? weatherModal = snapshot.data;
            if (snapshot.hasData) {
              return ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.7),
                      image: DecorationImage(
                        image: (weatherModal!.current.is_day == 1)
                            ? AssetImage('assets/img/img2.gif')
                            : AssetImage('assets/img/img14.gif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${weatherModal!.location.name}',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Successfully added to your City List'),
                                        action: SnackBarAction(
                                          label: '',
                                          onPressed: () {},
                                        ),
                                      ),
                                    );
                                    weatherProviderTrue.addFavourite(
                                        // weatherModal.location.name,
                                        weatherModal.location.name);

                                    weatherProviderTrue.addFavourite2(
                                      // weatherModal.location.name,

                                      weatherModal.current.temp_c,
                                    );
                                    weatherProviderTrue.addFavourite3(
                                      // weatherModal.location.name,
                                      weatherModal.current.condition.text,
                                    );
                                    weatherProviderTrue.weather3.add(
                                        weatherModal.current.condition.icon);
                                    // weatherProviderFalse
                                    //     .weatherModal!.current.condition.icon);
                                    // weatherProviderFalse.addFavourite();
                                    weatherProviderFalse.getFavourite();
                                  },
                                  child: Text(
                                    'Add to Fav City',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.2,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.25,
                                ),
                                Text(
                                  '${weatherModal.current.temp_c}',
                                  style: TextStyle(
                                      fontSize: 80,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    '°C',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.23,
                                ),
                                SizedBox(
                                  width: width * 0.5,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    // '${weatherModal.current.condition.text}',
                                    'Most Clear',
                                    //
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 15,
                                              color: Colors.white)
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.07,
                            ),
                            Container(
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                // color: Colors.black38,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '☀ UV INDEX',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 15,
                                                          color: Colors.white)
                                                    ]),
                                              ),
                                              Text(
                                                '4.01',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  shadows: [
                                                    Shadow(
                                                        blurRadius: 15,
                                                        color: Colors.white)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: width * 0.05,),
                                    Container(
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '🌬 WIND',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 15,
                                                          color: Colors.white)
                                                    ]),
                                              ),
                                              Text(
                                                '${weatherModal.current.wind_mph}m/s',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  shadows: [
                                                    Shadow(
                                                        blurRadius: 15,
                                                        color: Colors.white)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '💧 HUMIDITY',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 15,
                                                          color: Colors.white)
                                                    ]),
                                              ),
                                              Text(
                                                '82',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  shadows: [
                                                    Shadow(
                                                        blurRadius: 15,
                                                        color: Colors.white)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  listOfImage.length,
                                  (index) => Column(
                                    children: [
                                      Text(
                                        '${(weatherModal.current.is_day == 1) ? listOfImage[index]['time'] : listOfImage[index]['name']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                          (weatherModal.current.is_day == 1)
                                              ? listOfImage[index]['image']
                                              : listOfImage[index]['img'],
                                        ))),
                                      ),
                                      Text(
                                        '${listOfImage[index]['name']}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
        ),
      ),
    );
  }
}

List CloudList = [
  CupertinoIcons.cloud_bolt_fill,
  CupertinoIcons.cloud_bolt_rain_fill,
  CupertinoIcons.cloud_drizzle_fill,
  CupertinoIcons.cloud_fill,
  CupertinoIcons.cloud_moon_bolt_fill,
  CupertinoIcons.cloud_moon_fill,
  CupertinoIcons.cloud_moon_rain_fill,
  // CupertinoIcons.cloud_heavyrain_fill,
  // CupertinoIcons.cloud_snow_fill,
  // CupertinoIcons.cloud_snow_fill,
];

List dayList = [
  'Mon',
  'Tus',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
