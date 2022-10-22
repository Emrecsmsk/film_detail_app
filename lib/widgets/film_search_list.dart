import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinsoftfilm/controller/home_controller.dart';
import 'package:pinsoftfilm/mixin/colors/lottie_mixin.dart';
import 'package:pinsoftfilm/screen/film_view.dart';

class ListSearchFilm extends StatelessWidget with LottieMixin {
  ListSearchFilm({
    Key? key,
    required PageController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final HomeController _homeController = Get.put(HomeController());
  final PageController _searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
            flex: 1,
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                _searchController.previousPage(
                    duration: Duration(seconds: 1), curve: Curves.bounceInOut);
              },
              icon: Icon(
                Icons.keyboard_arrow_up_outlined,
              ),
            )),
        Expanded(
          flex: 18,
          child: Container(
              child: _homeController.isFound.value
                  ? ListView.builder(
                      itemCount:
                          _homeController.filmSearchList?.search?.length ?? 1,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            await _homeController.fetchFilm(_homeController
                                    .filmSearchList?.search?[index].imdbID ??
                                "tt6468680");
                            Get.to(FilmView());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  _homeController.filmSearchList?.search?[index]
                                          .poster ??
                                      "https://randompicturegenerator.com/img/dragon-generator/ge4986fa68cad572b70eed9e2689d5320a2305e7c2e02494eddaf29baebd2b41489b979ea7d1bd230b537c88b337b069c_640.jpg",
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                              title: Text(_homeController
                                      .filmSearchList?.search?[index].title ??
                                  ""),
                            ),
                          ),
                        );
                      },
                    )
                  : LottieBuilder.asset(notFound)),
        ),
      ],
    );
  }
}
