import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';
import 'external_ids.dart';
import 'external_urls.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  Album? album;
  List<Artist>? artists;
  @JsonKey(name: 'disc_number')
  int? discNumber;
  @JsonKey(name: 'duration_ms')
  int? durationMs;
  bool? explicit;
  @JsonKey(name: 'external_ids')
  ExternalIds? externalIds;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  @JsonKey(name: 'is_local')
  bool? isLocal;
  @JsonKey(name: 'is_playable')
  bool? isPlayable;
  String? name;
  int? popularity;
  @JsonKey(name: 'preview_url')
  String? previewUrl;
  @JsonKey(name: 'track_number')
  int? trackNumber;
  String? type;
  String? uri;

  Item({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
