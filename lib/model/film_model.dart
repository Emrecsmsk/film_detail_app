import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'film_model.g.dart';

@JsonSerializable()
class FilmModel extends INetworkModel<FilmModel> {
  String? title;
  String? year;
  String? rated;
  String? runtime;
  String? genre;
  String? actors;
  String? plot;
  String? poster;
  List<Ratings>? ratings;
  String? imdbRating;
  String? imdbId;
  String? type;
  String? response;

  FilmModel(
      {this.title,
      this.year,
      this.rated,
      this.runtime,
      this.genre,
      this.actors,
      this.plot,
      this.poster,
      this.ratings,
      this.imdbRating,
      this.imdbId,
      this.type,
      this.response});

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return _$FilmModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilmModelToJson(this);
  }

  @override
  FilmModel fromJson(Map<String, dynamic> json) {
    return _$FilmModelFromJson(json);
  }
}

@JsonSerializable()
class Ratings {
  String? Source;
  String? Value;

  Ratings({this.Source, this.Value});

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return _$CRatingsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CRatingsToJson(this);
  }
}
