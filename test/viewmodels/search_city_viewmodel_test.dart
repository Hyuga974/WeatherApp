import 'package:flutter_test/flutter_test.dart';
import 'package:final_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SearchCityViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
