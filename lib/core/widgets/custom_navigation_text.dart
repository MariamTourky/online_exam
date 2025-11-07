import 'package:flutter/material.dart';

import '../../config/theme/app_text_styles.dart';

class CustomNavigationText extends StatelessWidget {
  final String text;
  final void Function()? navigateTo;
  const CustomNavigationText({super.key, required this.text, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: navigateTo,
        child:  Text(
            text,
            style:AppTextStyles.baseMedium16),);
  }
}
