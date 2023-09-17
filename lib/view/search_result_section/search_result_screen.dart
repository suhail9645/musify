import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musify/controller/providers/search_result_provider.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/view/home_section/home_screen.dart';
import 'package:musify/view/search_result_section/widget/search_result_item.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchResultProvider>(context, listen: false)
          .getSearchResult(query);
      
    });
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
                    '"$query"',
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
      
    );
  }
}
