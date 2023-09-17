import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:musify/controller/services/all_data_service.dart';
import 'package:musify/model/artists/artist_item.dart';
import 'package:musify/model/artists/artists.dart';
import 'package:musify/model/failure.dart/failure.dart';


class ArtistsProvider extends ChangeNotifier {
  Either<Failure, List<ArtistItem>> failureOrSuccess=Left(Failure(errorMessage: '')) ;
  bool isLoading = true;
  Future<void> getPopularArtists() async {
    isLoading=true;
     notifyListeners();
    await Future.delayed(const Duration(seconds: 3)); //only for testing
   final successOrFailure=await AllDataServiceImp().getDatasWithType('artist', 'Hindi');
   isLoading=false;
    notifyListeners();
   if(successOrFailure.isRight){
    List<ArtistItem>allItems=[];
    Response response=successOrFailure.right;

    Artists data=Artists.fromJson(response.data['artists']);
    for (var element in data.allItems??[]) {
     
      allItems.add(element);
    }
    failureOrSuccess=Right(allItems);
    notifyListeners();
    
   }else{
    failureOrSuccess=Left(Failure(errorMessage: successOrFailure.left.errorMessage));
     notifyListeners();
   }

  }
}
