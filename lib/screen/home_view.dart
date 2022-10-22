import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinsoftfilm/controller/home_controller.dart';
import 'package:pinsoftfilm/widgets/search_field.dart';
import 'package:pinsoftfilm/widgets/film_search_list.dart';
import 'package:pinsoftfilm/widgets/top_film.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.fetchFilmList("endgame");
  }

  PageController _filmListController = PageController(
    initialPage: 0,
  );
  PageController _searchController = PageController(
    initialPage: 0,
  );

  HomeController _homeController = Get.put(HomeController());
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, right: 20, left: 20),
        child: Column(
          children: [
            _title(context),
            Expanded(
              child: SearchField(
                  homeController: _homeController,
                  textEditingController: _textEditingController,
                  searchController: _searchController),
            ),
            Expanded(
              flex: 5,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _searchController,
                children: [
                  TopFilmView(
                      homeController: _homeController,
                      controller: _filmListController),
                  ListSearchFilm(searchController: _searchController),
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  Expanded _title(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        "title".tr,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
