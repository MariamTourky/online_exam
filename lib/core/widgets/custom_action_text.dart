import 'package:flutter/material.dart';

import '../../config/theme/app_text_styles.dart';

class CustomActionText extends StatelessWidget {
  final String text;
  final void Function()? onTapAction;
  const CustomActionText({super.key, required this.text, this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapAction,
        child:  Text(
            text,
            style:AppTextStyles.baseMedium16),);
  }
}
