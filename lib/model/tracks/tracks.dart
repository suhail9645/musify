import 'package:json_annotation/json_annotation.dart';

import 'tracks.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  Tracks? tracks;

  Tracks({this.tracks});

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return _$TracksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TracksToJson(this);
}
