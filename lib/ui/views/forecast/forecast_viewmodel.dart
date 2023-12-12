import 'package:final_app/app/app.locator.dart';
import 'package:final_app/model/weather_model.dart';
import 'package:final_app/services/city_forecast_service.dart';
import 'package:stacked/stacked.dart';

class ForecastViewModel extends BaseViewModel {
  CityForecastService weatehrService = locator<CityForecastService>();

  WeatherModel? getSelectedCity() {
    return weatehrService.selectedCity;
  }

  List<WeatherModel?> searchCity(String city, day) {
    weatehrService
        .fetchCityData(city, day)
        .then((value) => city = value as String)
        .then((value) => notifyListeners());
    return weatehrService.forecastSelectedCity;
  }
}
