import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinsoftfilm/controller/home_controller.dart';
import 'package:pinsoftfilm/mixin/colors/lottie_mixin.dart';
import 'package:pinsoftfilm/screen/film_view.dart';

class TopFilmView extends StatelessWidget with LottieMixin {
  TopFilmView({
    Key? key,
    required HomeController homeController,
    required PageController controller,
  })  : _homeController = homeController,
        _controller = controller,
        super(key: key);

  final HomeController _homeController;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _homeController.isLoading.value
          ? Center(
              child: Lottie.asset(
                loading,
              ),
            )
          : Column(
              children: [
                Expanded(
                    child: Text(
                  "top".tr,
                  style: Theme.of(context).textTheme.headline5,
                )),
                Expanded(
                  flex: 9,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          _controller.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(Icons.keyboard_arrow_left)),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemCount:
                            _homeController.filmList?.search?.length ?? 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () async {
                                await _homeController.fetchFilm(_homeController
                                        .filmList?.search?[index].imdbID ??
                                    "tt6468680");
                                Get.to(FilmView());
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Image.network(
                                  _homeController
                                          .filmList?.search?[index].poster ??
                                      "https://randompicturegenerator.com/img/dragon-generator/ge4986fa68cad572b70eed9e2689d5320a2305e7c2e02494eddaf29baebd2b41489b979ea7d1bd230b537c88b337b069c_640.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.height,
                            height: MediaQuery.of(context).size.width * 0.75,
                          );
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInSine);
                        },
                        icon: Icon(Icons.keyboard_arrow_right)),
                  ]),
                ),
              ],
            ),
    );
  }
}
