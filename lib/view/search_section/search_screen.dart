import 'package:flutter/material.dart';
import 'package:musify/controller/providers/Trending_track_provider.dart';
import 'package:musify/controller/providers/play_list_provider.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/string.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/model/playlists/play_list_item.dart';
import 'package:musify/model/tracks/track_item.dart';
import 'package:musify/view/home_section/home_screen.dart';
import 'package:musify/view/search_result_section/search_result_screen.dart';
import 'package:provider/provider.dart';

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
          RecentSearch(screenWidth: screenWidth),
          PopularGeneres(screenWidth: screenWidth),
          hightSpace20,
        ],
      )),
    );
  }
}

class PopularGeneres extends StatelessWidget {
  const PopularGeneres({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Popular Generes',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            Consumer<PlayListProvider>(builder: (context, value, child) {
              if (value.failureOrSuccess.isRight) {
                List<PlayListItem> playLists = value.failureOrSuccess.right;
                return Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: playLists.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: screenWidth * 0.46,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        String? image = playLists[index].images?.first.url;
                        String? name = playLists[index].name;
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 18, 18),
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                opacity: 0.7,
                                image: NetworkImage(image ?? homeHeaderImage),
                                fit: BoxFit.fill),
                          ),
                          child: Center(
                            child: Text(
                              name ?? 'Unknown',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingTrackProvider>(builder: (context, value, child) {
      List<TrackItem> allTrendingTracks = value.failureOrSuccess.right;
      if (value.failureOrSuccess.isRight) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            // height: screenWidth * 0.70,
            width: double.infinity,
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      'Trending Tracks',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    PrimaryButton(
                      text: 'Clear',
                      onTap: () {},
                    )
                  ],
                ),
                Column(
                  children: List.generate(allTrendingTracks.length, (index) {
                    String? leadingImage =
                        allTrendingTracks[index].album?.images?.last.url;
                    String? title =
                        allTrendingTracks[index].album?.name?.split('(').first;
                    String? subtitle =
                        allTrendingTracks[index].artists?.first.name;
                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(leadingImage ?? homeHeaderImage),
                      ),
                      title: Text(
                        title ?? 'Unknown',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        subtitle ?? 'Unknown',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}

class SearchPageTextFormField extends StatelessWidget {
  const SearchPageTextFormField({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  final double screenWidth;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.72,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 54, 54),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'SearchResultScreen',
                          arguments:  SearchResultScreen(query: controller.text));
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                widthSpace10,
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    cursorHeight: 29,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.notifications,
            size: 28,
            color: primaryIconsColor,
          ),
          widthSpace10,
          const CircleAvatar(
            backgroundImage: NetworkImage(homeHeaderImage),
          )
        ],
      ),
    );
  }
}
