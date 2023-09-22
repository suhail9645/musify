
import 'package:flutter/material.dart';
import 'package:musify/core/const/colors.dart';
import 'package:musify/core/const/string.dart';
import 'package:musify/core/const/widget.dart';
import 'package:musify/view/search_result_section/search_result_screen.dart';

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
            width: screenWidth * 0.70,
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
                      if(controller.text.isNotEmpty){
                      Navigator.pushNamed(context, 'SearchResultScreen',
                          arguments:  SearchResultScreen(query: controller.text));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Type something')));
                      }
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
