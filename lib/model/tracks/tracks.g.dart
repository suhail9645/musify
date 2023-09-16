// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'tracks': instance.tracks,
    };
