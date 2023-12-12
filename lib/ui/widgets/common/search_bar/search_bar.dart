import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_bar_model.dart';

class SearchBar extends StackedView<SearchBarModel> {
  const SearchBar({super.key});

  @override
  Widget builder(
    BuildContext context,
    SearchBarModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  SearchBarModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchBarModel();
}
