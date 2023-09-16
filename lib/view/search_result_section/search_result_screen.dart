import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/view/home_section/home_screen.dart';
import 'package:musify/view/search_result_section/widget/search_result_item.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Search Result for',
                    style: GoogleFonts.ubuntu(fontSize: 25),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.play_arrow,
                    color: primaryIconsColor,
                    size: 35,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '"India Rock"',
                    style: GoogleFonts.raleway(fontSize: 24),
                  )
                ],
              ),
              hightSpace10,
              SearchResultItem(screenWidth: screenWidth),
              hightSpace20,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottemNavigationBar(),
    );
  }
}

