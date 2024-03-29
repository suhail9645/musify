
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/providers/track_item_provider.dart';
import '../../../core/const/string.dart';
import '../../../core/const/widget.dart';
import '../../../model/tracks/track_item.dart';
import '../../widget/list_tile_shimmer.dart';

class HomePopularSongs extends StatelessWidget {
  const HomePopularSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Popular Songs',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          hightSpace10,
          Consumer<TrackItemeProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return const ListTileShimmer();
            } else if (value.failureOrSuccess.isRight) {
              List<TrackItem> allPopularTracks = value.failureOrSuccess.right;
              return Column(
                children: List.generate(allPopularTracks.length, (index) {
                  String? leadingImage =
                      allPopularTracks[index].album?.images?.last.url;
                  String? title =
                      allPopularTracks[index].album?.name?.split('(').first;
                  String? subtitle =
                      allPopularTracks[index].artists?.first.name;
                  return ListTile(
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
                    trailing: InkWell(
                      onTap: () {
                       
                      },
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
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
    );
  }
}
