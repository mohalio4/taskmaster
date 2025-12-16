import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GlassButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.purple1, AppColors.purple2],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
