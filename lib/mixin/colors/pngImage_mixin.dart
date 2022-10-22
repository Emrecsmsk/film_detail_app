mixin PngImageMixin {
  late String anonymous = ok(_pngImage.anonymous.name);
  late String imdb = ok(_pngImage.imdb.name);
  late String metacritic = ok(_pngImage.metacritic.name);
  late String tomatoes = ok(_pngImage.tomatoes.name);

  String ok(String png) {
    return "assets/png/$png.png";
  }
}

enum _pngImage { anonymous, imdb, metacritic, tomatoes }
