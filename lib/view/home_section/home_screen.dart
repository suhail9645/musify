import 'package:flutter/material.dart';
import 'package:musify/controller/providers/artists_provider.dart';
import 'package:musify/controller/providers/track_item_provider.dart';
import 'package:provider/provider.dart';
import 'widget/home_artists.dart';
import 'widget/home_header.dart';
import 'widget/home_popular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ArtistsProvider>(context, listen: false).getPopularArtists();
       Provider.of<TrackItemeProvider>(context, listen: false).getPopularTracks();
    });

    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const HomeHeader(),
            HomeArtists(screenWidth: screenWidth),
            const HomePopularSongs()
          ],
        ),
      )),
      
    );
  }
}

