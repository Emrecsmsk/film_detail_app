// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmModel _$FilmModelFromJson(Map<String, dynamic> json) => FilmModel(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      rated: json['Rated'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      actors: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      poster: json['Poster'] as String?,
      ratings: (json['Ratings'] as List<dynamic>?)
          ?.map((e) => Ratings.fromJson(e as Map<String, dynamic>))
          .toList(),
      imdbRating: json['imdbRating'] as String?,
      imdbId: json['imdbId'] as String?,
      type: json['Type'] as String?,
      response: json['Response'] as String?,
    );

Map<String, dynamic> _$FilmModelToJson(FilmModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Poster': instance.poster,
      'Ratings': instance.ratings,
      'imdbRating': instance.imdbRating,
      'imdbId': instance.imdbId,
      'Type': instance.type,
      'Response': instance.response,
    };

Ratings _$CRatingsFromJson(Map<String, dynamic> json) => Ratings(
      Source: json['Source'] as String?,
      Value: json['Value'] as String?,
    );

Map<String, dynamic> _$CRatingsToJson(Ratings instance) => <String, dynamic>{
      'Source': instance.Source,
      'Value': instance.Value,
    };
