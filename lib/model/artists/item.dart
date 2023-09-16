import 'package:json_annotation/json_annotation.dart';

import 'external_urls.dart';
import 'followers.dart';
import 'image.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
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

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
