import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinsoftfilm/controller/home_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required HomeController homeController,
    required TextEditingController textEditingController,
    required PageController searchController,
  })  : _homeController = homeController,
        _textEditingController = textEditingController,
        _searchController = searchController,
        super(key: key);

  final HomeController _homeController;
  final TextEditingController _textEditingController;
  final PageController _searchController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () async {
                await _homeController
                    .fetchSearchFilmList(_textEditingController.text);
                _searchController.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.bounceInOut);
              },
              icon: Icon(Icons.search)),
          labelText: "search".tr,
        ),
        controller: _textEditingController,
        keyboardType: TextInputType.name,
      ),
    );
  }
}
