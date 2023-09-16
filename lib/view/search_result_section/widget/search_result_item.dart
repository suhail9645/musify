import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/string.dart';

import '../../home_section/home_screen.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            10,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(8),
              height: screenWidth * 0.48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 42, 42),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: screenWidth * 0.35,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          opacity: 0.8,
                          image: NetworkImage(homeHeaderImage),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              height: 25,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color.fromARGB(255, 33, 33, 32)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: primaryIconsColor,
                                    size: 20,
                                  ),
                                  const Text('4.2')
                                ],
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  const Color.fromARGB(255, 33, 33, 32),
                              child: Icon(
                                Icons.favorite,
                                color: primaryIconsColor,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '"Lonely Boy" by the black keys',
                        style: GoogleFonts.raleway(fontSize: 16),
                      ),
                      const Spacer(),
                      PrimaryButton(onTap: () {}, text: "Play")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
