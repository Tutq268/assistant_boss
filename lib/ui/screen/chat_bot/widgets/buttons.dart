import 'package:flutter/material.dart';
import 'package:hanam/ui/resource/styles/app_colors.dart';

class GreenElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GreenElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        backgroundColor: AppColors.backGroundColor,
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 40),
      ),
      child: Text(text),
    );
  }
}
