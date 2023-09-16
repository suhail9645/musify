// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) => Playlists(
      playlists: json['playlists'] == null
          ? null
          : Playlists.fromJson(json['playlists'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
      'playlists': instance.playlists,
    };
