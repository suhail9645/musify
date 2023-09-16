import 'package:json_annotation/json_annotation.dart';

import 'artists.dart';

part 'artists.g.dart';

@JsonSerializable()
class Artists {
  Artists? artists;

  Artists({this.artists});

  factory Artists.fromJson(Map<String, dynamic> json) {
    return _$ArtistsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}
