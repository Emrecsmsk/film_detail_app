import 'package:pinsoftfilm/model/film_list_model.dart';
import 'package:pinsoftfilm/model/film_model.dart';
import 'package:vexana/vexana.dart';

class OmdpService {
  late INetworkManager networkManager;
  String baseUrl = "http://www.omdbapi.com/?apikey=41ddc02e&";

  void init() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: baseUrl));
  }

  Future<FilmModel?> fetchFilms(String imdb) async {
    init();
    final response = await networkManager.send("i=$imdb",
        parseModel: FilmModel(), method: RequestType.GET);
    return response.data ?? FilmModel();
  }

  Future<FilmListModel?> fetchFilmList(String search) async {
    init();
    final response = await networkManager.send("s=$search",
        parseModel: FilmListModel(), method: RequestType.GET);
    return response.data ?? FilmListModel();
  }
}
