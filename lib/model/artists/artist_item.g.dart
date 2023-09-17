// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistItem _$ArtistItemFromJson(Map<String, dynamic> json) => ArtistItem(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      followers: json['followers'] == null
          ? null
          : Followers.fromJson(json['followers'] as Map<String, dynamic>),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      popularity: json['popularity'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$ArtistItemToJson(ArtistItem instance) =>
    <String, dynamic>{
      'external_urls': instance.externalUrls,
      'followers': instance.followers,
      'genres': instance.genres,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'popularity': instance.popularity,
      'type': instance.type,
      'uri': instance.uri,
    };
