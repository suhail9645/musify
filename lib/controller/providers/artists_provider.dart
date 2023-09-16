import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:musify/controller/services/access_token.dart';
import 'package:musify/controller/services/all_data_service.dart';
import 'package:musify/core/const/urls.dart';
import 'package:musify/model/artists/artist_item.dart';
import 'package:musify/model/failure.dart/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistsProvider extends ChangeNotifier {
  Either<Failure, List<ArtistItem>> failureOrSuccess = const Right([]);
  bool isLoading = true;
  Future<void> getPopularArtists() async {
   final successOrFailure=await AllDataServiceImp().getDatasWithType('artist', 'Malayalam');
   if(successOrFailure.isRight){
    List<ArtistItem>allItems=[];
    
   }
  }
}
