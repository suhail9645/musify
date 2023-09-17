import 'package:flutter/material.dart';
import 'package:musify/controller/providers/Trending_track_provider.dart';
import 'package:musify/controller/providers/play_list_provider.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/view/search_section/widget/popular_generas.dart';
import 'package:musify/view/search_section/widget/trending_tracks.dart';
import 'package:provider/provider.dart';
import 'widget/search_header.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TrendingTrackProvider>(context, listen: false)
          .getTrendingTracks();
      Provider.of<PlayListProvider>(context, listen: false).getPlayLists();
    });
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          SearchPageTextFormField(
            screenWidth: screenWidth,
            controller: controller,
          ),
          TrendingTrack(screenWidth: screenWidth),
          PopularGeneres(screenWidth: screenWidth),
          hightSpace20,
        ],
      )),
    );
  }
}


