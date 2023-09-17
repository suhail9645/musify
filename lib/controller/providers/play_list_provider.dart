import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:musify/model/playlists/play_list_item.dart';
import 'package:musify/model/playlists/playlists.dart';

import '../../model/failure.dart/failure.dart';
import '../services/all_data_service.dart';

class PlayListProvider extends ChangeNotifier{
  Either<Failure,List<PlayListItem>>failureOrSuccess= Left(Failure(errorMessage: ''));
  bool isLoading=true;
  Future<void> getPlayLists() async {
    isLoading=true;
     notifyListeners();
     await Future.delayed(const Duration(seconds: 3)); //only for testing
   final successOrFailure=await AllDataServiceImp().getDatasWithType('playlist', 'fejo');
   isLoading=false;
    notifyListeners();
   if(successOrFailure.isRight){
    List<PlayListItem>allItems=[];
    Response response=successOrFailure.right;
  Map<String,dynamic> value=response.data['playlists'];
     Playlists data=Playlists.fromJson(value);
    for (var element in data.playLists??[]) {
     
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