
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/const/colors.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          6,
          (index) => Shimmer.fromColors(
                baseColor: shimmerBase,
                highlightColor: shimmerHighlight,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
