// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmListModel _$FilmListModelFromJson(Map<String, dynamic> json) =>
    FilmListModel(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
      response: json['Response'] as String?,
    );

Map<String, dynamic> _$FilmListModelToJson(FilmListModel instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'Response': instance.response,
    };

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      imdbID: json['imdbID'] as String?,
      type: json['Type'] as String?,
      poster: json['Poster'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Yype': instance.type,
      'Poster': instance.poster,
    };
