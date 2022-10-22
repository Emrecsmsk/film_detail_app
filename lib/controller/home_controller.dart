import 'package:get/get.dart';
import 'package:pinsoftfilm/model/film_list_model.dart';
import 'package:pinsoftfilm/model/film_model.dart';
import 'package:pinsoftfilm/service/omdp_service.dart';

class HomeController extends GetxController {
  OmdpService omdpService = OmdpService();
  var isLoading = false.obs;
  var isFound = true.obs;

  FilmListModel? filmList = FilmListModel();
  FilmListModel? filmSearchList = FilmListModel();
  FilmModel? filmModel = FilmModel();
  List splittedGenre = [];
  List splittedActors = [];

  Future<void> fetchFilmList(String search) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    filmList = await omdpService.fetchFilmList(search);
    isLoading.value = false;
  }

  Future<void> fetchSearchFilmList(String search) async {
    await Future.delayed(Duration(seconds: 1));
    filmSearchList = FilmListModel();
    filmSearchList = await omdpService.fetchFilmList(search);
    filmSearchList?.search != null
        ? isFound.value = true
        : isFound.value = false;
  }

  Future<void> fetchFilm(String imdb) async {
    filmModel = await omdpService.fetchFilms(imdb);
    filmModel?.ratings?.add(
      Ratings(
        Value: "N/A",
      ),
    );
    filmModel?.ratings?.add(
      Ratings(
        Value: "N/A",
      ),
    );

    final splittedRuntime = filmModel!.runtime!.split(' ');
    int? intSplittedRuntime = int.tryParse(splittedRuntime[0]);
    int hour = ((intSplittedRuntime ?? 60) / 60).toInt();
    int minute = (intSplittedRuntime ?? 50) - hour * 60;
    filmModel!.runtime = "${hour}h${minute}min";

    filmModel?.genre?.replaceAll(" ", "");
    splittedGenre = filmModel!.genre!.split(",");

    splittedActors = filmModel!.actors!.split(",");
    for (var i = 0; i < splittedActors.length; i++) {
      if (splittedActors[i] is String) {
        if (splittedActors[i].startsWith(" ")) {
          String element = splittedActors[i];
          splittedActors[i] = element.replaceFirst(RegExp(r' '), '');
          splittedActors[i] = splittedActors[i].replaceAll(RegExp(r' '), '\n');
        }
      }
    }
  }
}
