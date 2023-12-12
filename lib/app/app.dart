import 'package:final_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:final_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:final_app/ui/views/home/home_view.dart';
import 'package:final_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:final_app/ui/views/search_city/search_city_view.dart';
import 'package:final_app/ui/views/forecast/forecast_view.dart';
import 'package:final_app/services/city_forecast_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SearchCityView),
    MaterialRoute(page: ForecastView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CityForecastService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
