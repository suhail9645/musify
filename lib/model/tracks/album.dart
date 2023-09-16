import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';
import 'external_urls.dart';
import 'image.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  @JsonKey(name: 'album_type')
  String? albumType;
  List<Artist>? artists;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  @JsonKey(name: 'is_playable')
  bool? isPlayable;
  String? name;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'release_date_precision')
  String? releaseDatePrecision;
  @JsonKey(name: 'total_tracks')
  int? totalTracks;
  String? type;
  String? uri;

  Album({
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.isPlayable,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
