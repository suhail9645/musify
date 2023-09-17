import 'package:flutter/material.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/providers/play_list_provider.dart';
import '../../../core/const/string.dart';
import '../../../model/playlists/play_list_item.dart';

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
            hightSpace10,
            Consumer<PlayListProvider>(builder: (context, value, child) {
              if (value.isLoading) {
                return Expanded(
                    child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: screenWidth * 0.46,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 4,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: shimmerBase,
                    highlightColor: shimmerHighlight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ));
              } else if (value.failureOrSuccess.isRight) {
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
                return const Center(
                  child: Text('Something wrong'),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
