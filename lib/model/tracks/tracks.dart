import 'package:json_annotation/json_annotation.dart';
import 'package:musify/model/tracks/track_item.dart';

import 'tracks.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
    @JsonKey(name: 'items')
  List<TrackItem> ?allPopularTracks;
  Tracks({this.allPopularTracks});

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return _$TracksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TracksToJson(this);
}
