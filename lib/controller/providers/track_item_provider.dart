
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:musify/model/failure.dart/failure.dart';
import 'package:musify/model/tracks/tracks.dart';
import '../../model/tracks/track_item.dart';
import '../services/all_data_service.dart';

class TrackItemeProvider extends ChangeNotifier{
  Either<Failure,List<TrackItem>>failureOrSuccess=const Right([]);
  bool isLoading=true;
  Future<void> getPopularTracks() async {
   final successOrFailure=await AllDataServiceImp().getDatasWithType('track', 'Malayalam');
   if(successOrFailure.isRight){
    List<TrackItem>allItems=[];
    Response response=successOrFailure.right;
  Map<String,dynamic> value=response.data['tracks'];
     Tracks data=Tracks.fromJson(value);
    for (var element in data.allPopularTracks??[]) {
     
      allItems.add(element);
    }
    failureOrSuccess=Right(allItems);
    notifyListeners();
    
   }else{
    failureOrSuccess=Left(Failure(errorMessage: successOrFailure.left.errorMessage));
   }

  }
}