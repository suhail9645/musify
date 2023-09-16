import 'package:json_annotation/json_annotation.dart';

import 'playlists.dart';

part 'playlists.g.dart';

@JsonSerializable()
class Playlists {
  Playlists? playlists;

  Playlists({this.playlists});

  factory Playlists.fromJson(Map<String, dynamic> json) {
    return _$PlaylistsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistsToJson(this);
}
