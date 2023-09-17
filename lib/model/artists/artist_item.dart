import 'package:json_annotation/json_annotation.dart';

import 'external_urls.dart';
import 'followers.dart';
import 'image.dart';

part 'artist_item.g.dart';

@JsonSerializable()
class ArtistItem {
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  ArtistItem({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory ArtistItem.fromJson(Map<String, dynamic> json) => _$ArtistItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistItemToJson(this);
}
