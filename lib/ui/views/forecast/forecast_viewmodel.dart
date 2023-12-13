import 'package:final_app/app/app.locator.dart';
import 'package:final_app/model/weather_model.dart';
import 'package:final_app/services/city_forecast_service.dart';
import 'package:stacked/stacked.dart';

class ForecastViewModel extends BaseViewModel {
  CityForecastService weatehrService = locator<CityForecastService>();

  String selectedCity = "No city";
  List<WeatherModel>? selectedCityForecastWeather;

  String getSelectedCity() {
    //selectedCity = selectedCityForecastWeather?[0].name as String;
    return selectedCity;
  }

  List<WeatherModel?> searchCity(String city) {
    weatehrService
        .fetchCityForecastData(city)
        .then((value) => selectedCityForecastWeather = value)
        .then((value) => notifyListeners());
    return weatehrService.forecastSelectedCity;
  }
}
