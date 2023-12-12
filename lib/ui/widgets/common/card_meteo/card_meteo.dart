import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'card_meteo_model.dart';

class CardMeteo extends StackedView<CardMeteoModel> {
  const CardMeteo({super.key});

  @override
  Widget builder(
    BuildContext context,
    CardMeteoModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  CardMeteoModel viewModelBuilder(
    BuildContext context,
  ) =>
      CardMeteoModel();
}
