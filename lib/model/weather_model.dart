import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  String? name;
  String? dat;
  String? lon;
  String? lat;
  String? desc;
  String? temp;
  String? hum;
  String? imgUrl;

  WeatherModel(String data, day) {
    Map<String, dynamic> responseData =
        jsonDecode(data) as Map<String, dynamic>;
    print(responseData);
    name = responseData["city"]["name"];
    print(name);
    String test = responseData["list"][0 * 8]["dt_txt"];
    DateTime dateTest = DateTime.parse(test);
    dat = DateFormat('dd MMMM yyyy').format(dateTest);
    lon = responseData["city"]["coord"]["lon"].toString();
    lat = responseData["city"]["coord"]["lat"].toString();
    hum = responseData["list"][0 * 8]["main"]["humidity"].toString();
    temp = responseData["list"][0 * 8]["main"]["temp"].toString() + "°C";
    desc = responseData["list"][0 * 8]["weather"][0]["description"];

    String imgID = responseData["list"][0 * 8]["weather"][0]["icon"];
    imgUrl = "http://openweathermap.org/img/w/" + imgID + ".png";
  }
}
