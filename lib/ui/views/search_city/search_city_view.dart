import 'package:final_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_city_viewmodel.dart';

class SearchCityView extends StackedView<SearchCityViewModel> {
  const SearchCityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchCityViewModel viewModel,
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
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: myThirdColor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          _SearchBox(
              titleText: "Search a city", searchFunc: viewModel.searchCity),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ListView(
                children: [
                  // Title -> Name of City
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      viewModel.selectedCity,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  // subtitle (smaller) -< Lat & long
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            viewModel.selectedCityWeather?.lat ?? "??.???",
                            style: const TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            viewModel.selectedCityWeather?.lon ?? "??.???",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  // Center -> Icon for meteo + Temperature
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.network(
                                viewModel.selectedCityWeather?.imgUrl ?? "",
                                scale: 0.30),
                            // : const Icon(
                            //     Icons.cloudy_snowing,
                            //     color: Color.fromARGB(255, 223, 219, 219),
                            //     size: 200,
                            //   ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                viewModel.selectedCityWeather?.temp ?? "?? °C",
                                style: TextStyle(fontSize: 45)),
                          ),
                        ]),
                  ),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          viewModel.selectedCityWeather?.desc ??
                              "A Little description of the meteo of the day",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // update at -> last udpate of the app

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Last update at ???",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(myPrimaryColor),
                  ),
                  onPressed: () {
                    viewModel.redirectToForcast();
                  },
                  child: const Text(
                    "Go to the daily meteo",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            ],
          )
        ]),
      ),
    );
  }

  @override
  SearchCityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchCityViewModel();
}

class _SearchBox extends StatelessWidget {
  const _SearchBox(
      {super.key, required this.searchFunc, required this.titleText});
  final Function searchFunc;
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
          searchFunc(value);

          //print(value);
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
