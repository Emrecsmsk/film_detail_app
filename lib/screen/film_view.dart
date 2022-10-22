import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinsoftfilm/controller/home_controller.dart';
import 'package:pinsoftfilm/mixin/colors/pngImage_mixin.dart';
import 'package:pinsoftfilm/mixin/colors/colors_mixin.dart';

class FilmView extends StatefulWidget {
  const FilmView({super.key});

  @override
  State<FilmView> createState() => _FilmViewState();
}

class _FilmViewState extends State<FilmView> with ColorMixin, PngImageMixin {
  @override
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              _filmPoster(context),
              _filmRatings(context),
              _getBack(),
            ],
          ),
        ),
        Expanded(flex: 9, child: _filmDetail())
      ],
    ));
  }

  Container _filmPoster(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
        child: Image.network(
          _homeController.filmModel?.poster ??
              "https://picsum.photos/id/237/200/300",
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.width * 0.75,
    );
  }

  Positioned _filmRatings(BuildContext context) {
    return Positioned.fill(
      left: 30,
      top: MediaQuery.of(context).size.width * 0.65,
      child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ratingOption(
                  context, imdb, _homeController.filmModel!.imdbRating!),
              _ratingOption(context, tomatoes,
                  _homeController.filmModel!.ratings![1].Value!),
              _ratingOption(context, metacritic,
                  _homeController.filmModel!.ratings![2].Value!),
            ],
          ),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(50)))),
    );
  }

  Padding _ratingOption(BuildContext context, String img, String rating) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          SizedBox(width: 50, height: 50, child: Image.asset(img)),
          Text(
            rating,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Positioned _getBack() {
    return Positioned(
      left: 10,
      top: 30,
      child: IconButton(
          onPressed: (() => Get.back()),
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: white,
          )),
    );
  }

  Padding _filmDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 7,
                child: Text(_homeController.filmModel?.title ?? "",
                    style: Theme.of(context).textTheme.headline5)),
            Expanded(
              flex: 8,
              child: _yearRatedRuntimeDetail(),
            ),
            Expanded(
              flex: 13,
              child: _filmGenre(),
            ),
            Expanded(
              flex: 7,
              child: Text(
                "plot".tr,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                child: Text(
                  _homeController.filmModel?.plot ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: darkGrey,
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                "cast".tr,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              flex: 25,
              child: _castAndCrewPhoto(),
            )
          ],
        ),
      ),
    );
  }

  Row _yearRatedRuntimeDetail() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            _homeController.filmModel?.year ?? "2007",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Expanded(
          child: Text(
            _homeController.filmModel?.rated ?? "PG-13",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Expanded(
          child: Text(
            _homeController.filmModel?.runtime ?? "2h32min",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Spacer()
      ],
    );
  }

  ListView _filmGenre() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      itemCount: _homeController.splittedGenre.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                width: 1,
                color: lightGrey,
              ),
            ),
          ),
          child: Text(_homeController.splittedGenre[index],
              style: Theme.of(context).textTheme.subtitle1),
        );
      },
    );
  }

  ListView _castAndCrewPhoto() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _homeController.splittedActors.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Column(children: [
                      Image.asset(
                        anonymous,
                        fit: BoxFit.cover,
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    _homeController.splittedActors[index],
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
