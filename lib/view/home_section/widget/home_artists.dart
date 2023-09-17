import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/core/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/providers/artists_provider.dart';
import '../../../core/const/string.dart';
import '../../../core/const/widget.dart';
import '../../../model/artists/artist_item.dart';
import '../../widget/primary_button.dart';

class HomeArtists extends StatelessWidget {
  const HomeArtists({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Discover Music',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Explore',
                onTap: () => Navigator.pushNamed(context, 'SearchScreen'),
              )
            ],
          ),
          hightSpace10,
          Consumer<ArtistsProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                        baseColor:shimmerBase,
                        highlightColor:shimmerHighlight,
                        child: Container(
                          width: screenWidth * 0.29,
                          height: screenWidth * 0.34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black
                          ),
                        ))),
              );
            } else if (value.failureOrSuccess.isRight) {
              List<ArtistItem> allArtistData = value.failureOrSuccess.right;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(allArtistData.length, (index) {
                    String? image = allArtistData[index].images?.last.url;
                    String? text = allArtistData[index].name;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: screenWidth * 0.29,
                        height: screenWidth * 0.34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image: NetworkImage(image ?? homeHeaderImage),
                              fit: BoxFit.fill),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(180, 174, 88, 231),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  text!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            } else {
              return const Text('Something wrong');
            }
          })
        ],
      ),
    );
  }
}
