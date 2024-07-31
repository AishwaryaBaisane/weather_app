import 'package:flutter/material.dart';

class WeatherModal {
  late Location location;
  late Current current;

  WeatherModal({required this.location, required this.current});

  factory WeatherModal.fromJson(Map m1) {
    return WeatherModal(
        location: Location.fromJson(m1['location']),
        current: Current.fromJson(m1['current']));
  }
}

class Location {
  late String name, region, country, tz_id, localtime;

  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.tz_id,
      required this.localtime});

  factory Location.fromJson(Map m1) {
    return Location(
        name: m1['name'],
        region: m1['region'],
        country: m1['country'],
        tz_id: m1['tz_id'],
        localtime: m1['localtime']);
  }
}

class Current {
  late String last_updated;
  late int last_updated_epoch,wind_degree;
  late double
      temp_c,
      temp_f,
      wind_mph,
      wind_kph,
      vis_miles;
  late int is_day;
  late Condition condition;

  Current(
      {required this.last_updated,
      required this.last_updated_epoch,
      required this.temp_c,
      required this.temp_f,
      required this.wind_mph,
      required this.wind_kph,
      required this.wind_degree,
      required this.vis_miles,
      required this.is_day,
      required this.condition});

  factory Current.fromJson(Map m1) {
    return Current(
      last_updated: m1['last_updated'],
      last_updated_epoch: m1['last_updated_epoch'],
      temp_c: m1['temp_c'],
      temp_f: m1['temp_f'],
      wind_mph: m1['wind_mph'],
      wind_kph: m1['wind_kph'],
      wind_degree: m1['wind_degree'],
      vis_miles: m1['vis_miles'],
      is_day: m1['is_day'],
      condition: Condition.fromJson(
        m1['condition'],
      ),
    );
  }
}

class Condition {
  late String text, icon;

  Condition({required this.text, required this.icon});

  factory Condition.fromJson(Map m1) {
    return Condition(text: m1['text'], icon: m1['icon']);
  }
}

List y = [
  {
    "location": {
      "name": "Surat",
      "region": "Gujarat",
      "country": "India",
      "lat": 20.97,
      "lon": 72.9,
      "tz_id": "Asia/Kolkata",
      "localtime_epoch": 1722335269,
      "localtime": "2024-07-30 15:57"
    },
    "current": {
      "last_updated_epoch": 1722334500,
      "last_updated": "2024-07-30 15:45",
      "temp_c": 29.3,
      "temp_f": 84.7,
      "is_day": 1,
      "condition": {
        "text": "Light rain shower",
        "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png",
        "code": 1240
      },
      "wind_mph": 18.6,
      "wind_kph": 29.9,
      "wind_degree": 225,
      "wind_dir": "SW",
      "pressure_mb": 1000.0,
      "pressure_in": 29.54,
      "precip_mm": 0.89,
      "precip_in": 0.04,
      "humidity": 81,
      "cloud": 88,
      "feelslike_c": 35.7,
      "feelslike_f": 96.2,
      "windchill_c": 29.3,
      "windchill_f": 84.7,
      "heatindex_c": 35.7,
      "heatindex_f": 96.2,
      "dewpoint_c": 25.8,
      "dewpoint_f": 78.4,
      "vis_km": 10.0,
      "vis_miles": 6.0,
      "uv": 6.0,
      "gust_mph": 29.8,
      "gust_kph": 47.9
    }
  }
];
