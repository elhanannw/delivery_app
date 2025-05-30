/*
* Reusable Icons and text widgets
* */

import 'package:flutter/cupertino.dart';
import 'package:projects/utils/dimensions.dart';
import 'package:projects/widgets/small_text.dart';

class IconAndTextWidgets extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidgets({super.key, required this.icon,
    required this.text,
    required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}
