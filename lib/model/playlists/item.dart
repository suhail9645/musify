import 'package:json_annotation/json_annotation.dart';

import 'external_urls.dart';
import 'image.dart';
import 'owner.dart';
import 'tracks.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  bool? collaborative;
  String? description;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  Owner? owner;
  @JsonKey(name: 'primary_color')
  dynamic primaryColor;
  dynamic public;
  @JsonKey(name: 'snapshot_id')
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  Item({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
