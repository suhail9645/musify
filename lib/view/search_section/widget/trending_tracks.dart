import 'package:flutter/material.dart';
import 'package:musify/model/tracks/track_item.dart';
import 'package:musify/view/widget/list_tile_shimmer.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/Trending_track_provider.dart';
import '../../../core/const/string.dart';
import '../../widget/primary_button.dart';

class TrendingTrack extends StatelessWidget {
  const TrendingTrack({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
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
            Consumer<TrendingTrackProvider>(builder: (context, value, child) {
              if (value.isLoading) {
                return const ListTileShimmer();
              }
              if (value.failureOrSuccess.isRight) {
                List<TrackItem> allTrendingTracks =
                    value.failureOrSuccess.right;
                return Column(
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
                );
              } else {
                return const Center(
                  child: Text('Something wrong'),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
