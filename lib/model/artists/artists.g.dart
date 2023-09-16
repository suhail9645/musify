// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      artists: json['artists'] == null
          ? null
          : Artists.fromJson(json['artists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'artists': instance.artists,
    };
