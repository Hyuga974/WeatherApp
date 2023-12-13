// ignore_for_file: unnecessary_const

import 'package:final_app/model/weather_model.dart';
import 'package:final_app/services/city_forecast_service.dart';
import 'package:final_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'forecast_viewmodel.dart';

class ForecastView extends StackedView<ForecastViewModel> {
  const ForecastView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForecastViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: myPrimaryColor,
          title: const Text("My Mete-App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.sunny,
                color: Color.fromRGBO(255, 111, 0, 1),
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Hi')));
              },
            )
          ]),
      backgroundColor: myThirdColor,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _SearchBox(
              titleText: "Search forecast's city",
              searchFunction: viewModel.searchCity,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Forecast over 7 days for',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(viewModel.getSelectedCity()),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(children: [
                //     const Text("Longitude", style: TextStyle(fontSize: 15)),
                //     Text(
                //         viewModel.weatehrService.forecastSelectedCity[0].lon ??
                //             " ??? ",
                //         style: const TextStyle(fontSize: 15))
                //   ]),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Column(children: [
                //     const Text("Latitude",
                //         style: const TextStyle(fontSize: 15)),
                //     Text(
                //         viewModel.weatehrService.forecastSelectedCity[0].lat ??
                //             " ??? ",
                //         style: const TextStyle(fontSize: 15))
                //   ]),
                // ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: CardMeteo(
                          forecastViewModel: viewModel, dayNumber: index));
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ForecastViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForecastViewModel();
}

class CardMeteo extends StatelessWidget {
  const CardMeteo(
      {super.key, required this.forecastViewModel, required this.dayNumber});

  final int dayNumber;
  final ForecastViewModel forecastViewModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherData =
        forecastViewModel.weatehrService.forecastSelectedCity[dayNumber];
    return Center(
      child: Card(
        color: mySecondColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(weatherData.dat ?? "Today",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(weatherData.imgUrl ?? "", scale: 0.75),
                Text(
                  weatherData.temp ?? "?? °C",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            Text(
              weatherData.desc ?? "?????",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            // ListTile(
            //   leading: Image.network(weatherData.imgUrl ?? "", scale: 0.30),
            //   title: Text(weatherData.dat ?? "Today",
            //       style: const TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w400,
            //       )),
            //   subtitle: Text(
            //     weatherData.desc ?? "?????",
            //     style: const TextStyle(color: Colors.white, fontSize: 18),
            //   ),
            //   trailing: Text(
            //     weatherData.temp ?? "?? °C",
            //     style: const TextStyle(color: Colors.white, fontSize: 18),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox(
      {super.key, required this.titleText, required this.searchFunction});
  final String titleText;
  final Function searchFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 0, 0, 0),
        border: Border.all(color: Colors.black87, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onSubmitted: (String value) {
          searchFunction(value);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(
            Icons.search,
            color: myPrimaryColor,
            size: 20,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: titleText,
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
