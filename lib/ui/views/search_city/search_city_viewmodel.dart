import 'package:final_app/app/app.locator.dart';
import 'package:final_app/app/app.router.dart';
import 'package:final_app/model/weather_model.dart';
import 'package:final_app/services/city_forecast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchCityViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _cityForcastService = locator<CityForecastService>();

  String selectedCity = " No city selected";
  WeatherModel? selectedCityWeather;

  void redirectToForcast() {
    _navigationService.navigateToForecastView();
  }

  WeatherModel? searchCity(String city) {
    selectedCity = city;
    _cityForcastService
        .fetchCityData(city, 0)
        .then((value) => selectedCityWeather = value as WeatherModel?)
        .then((value) => notifyListeners());
    //Forecast here
    return _cityForcastService.selectedCity;
  }
}
