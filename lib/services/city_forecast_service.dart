import 'package:final_app/model/weather_model.dart';
import 'package:dio/dio.dart';

class CityForecastService {
  WeatherModel? selectedCity;
  List<WeatherModel> forecastSelectedCity = [];

  Future<WeatherModel> fetchCityData(String cityName, int day) async {
    // Call API
    final Dio dio = Dio();
    final Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=ac59bf27791afc83451c15377ca828ce');
    print(response);
    WeatherModel selectedCity = WeatherModel(response.toString(), day);
    return selectedCity;
  }

  Future<List<WeatherModel>> fetchCityForecastData(String cityName) async {
    // Call API
    final Dio dio = Dio();
    final Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=ac59bf27791afc83451c15377ca828ce');
    print(response);

    WeatherModel? thisForecastSelectedCity;
    for (int i = 0; i < 5; i++) {
      WeatherModel thisForecastSelectedCity =
          WeatherModel(response.toString(), i);
      forecastSelectedCity.add(thisForecastSelectedCity);
    }
    return forecastSelectedCity;
  }
}
