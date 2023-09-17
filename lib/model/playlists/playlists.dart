import 'package:json_annotation/json_annotation.dart';
import 'package:musify/model/playlists/play_list_item.dart';
part 'playlists.g.dart';

@JsonSerializable()
class Playlists {
    @JsonKey(name: 'items')
  List<PlayListItem>? playLists;

  Playlists({this.playLists});

  factory Playlists.fromJson(Map<String, dynamic> json) {
    return _$PlaylistsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistsToJson(this);
}
