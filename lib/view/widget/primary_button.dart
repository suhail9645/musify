


import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    required this.text,
  });
  final Function() onTap;
  final double? height;
  final double? width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 90,
        decoration: BoxDecoration(
            color: primaryButtonColor, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
