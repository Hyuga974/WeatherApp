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
            const _SearchBox(titleText: "Search forecast's city"),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Forecast over 7 days',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: Card(
                      color: mySecondColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.cloud,
                              color: Color.fromARGB(255, 78, 78, 78),
                              size: 50,
                            ),
                            title: Text("Today",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                )),
                            subtitle: Text(
                              viewModel.weatehrService
                                  .forecastSelectedCity[index].desc as String,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            trailing: Text(
                              "?? °C",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(children: [
                                  Text("Longitude",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  Text(" ??? ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15))
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(children: [
                                  Text("Latitude",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  Text(" ??? ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15))
                                ]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // CardMeteo(
                    //     forecastViewModel: viewModel, dayNumber: index)
                  );
                },
                itemCount: 7,
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
    return const Center(
      child: Card(
        color: mySecondColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.cloud,
                color: Color.fromARGB(255, 78, 78, 78),
                size: 50,
              ),
              title: Text("Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  )),
              subtitle: Text(
                weatherData.desc as String,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: Text(
                "?? °C",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Text("Longitude",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Text(" ??? ",
                        style: TextStyle(color: Colors.white, fontSize: 15))
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Text("Latitude",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Text(" ??? ",
                        style: TextStyle(color: Colors.white, fontSize: 15))
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox({super.key, required this.titleText});
  final String titleText;
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
          print(value);
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
