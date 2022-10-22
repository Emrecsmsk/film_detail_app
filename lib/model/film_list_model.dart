import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'film_list_model.g.dart';

@JsonSerializable()
class FilmListModel extends INetworkModel<FilmListModel> {
  List<Search>? search;
  String? response;

  FilmListModel({this.search, this.response});

  factory FilmListModel.fromJson(Map<String, dynamic> json) {
    return _$FilmListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FilmListModelToJson(this);
  }

  @override
  FilmListModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$FilmListModelFromJson(json);
  }
}

@JsonSerializable()
class Search {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Search({this.title, this.year, this.imdbID, this.type, this.poster});

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchToJson(this);
  }
}
