import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({required this.icon, required this.onTap, super.key});
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:18,horizontal: 15),
          child: icon,
        ),
      ),
    );
  }
}
