
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/string.dart';
import '../../../core/const/widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Text(
            'Good afternoon,Comensec',
            style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryTextColor),
          ),
          const Spacer(),
          Icon(
            Icons.headphones,
            color: primaryTextColor,
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
