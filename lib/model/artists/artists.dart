import 'package:json_annotation/json_annotation.dart';
import 'package:musify/model/artists/artist_item.dart';


part 'artists.g.dart';

@JsonSerializable()
class Artists {
  @JsonKey(name: 'items')
  List<ArtistItem>?allItems;
  
  Artists({this.allItems});

  factory Artists.fromJson(Map<String, dynamic> json) {
    return _$ArtistsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}
