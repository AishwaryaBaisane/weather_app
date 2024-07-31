
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Api_Helper/Weather_app.dart';
import 'package:weather_app/Modal/Weather_modal.dart';

class WeatherProvider extends ChangeNotifier
{
  ApiHelper apiHelper = ApiHelper();
  WeatherModal? weatherModal;
  String search = 'Surat';
  List<String> Weather = [];
  List<double> Weather1 = [];
  List<String> Weather2 = [];

  void ImgFind(String img)
  {
    search = img;
    notifyListeners();
  }

  Future<WeatherModal> SearchWeather(String img)
  async {
    final json = await apiHelper.apiCalling(img);
    final data = WeatherModal.fromJson(json);
    return data;
  }

  Future<void> addFavourite(String name)
  async {
    String data = "$name";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }
  Future<void> addFavourite2(double temp)
  async {
    double data = temp;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Weather1.add(data);
    sharedPreferences.setStringList('weather', Weather);
  }


  Future<void> getFavourite()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> weather = sharedPreferences.getStringList('weather') ?? <String>[];
    notifyListeners();
  }

  WeatherProvider()
  {
    getFavourite();
  }

}


