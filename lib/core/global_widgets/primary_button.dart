// lib/core/widgets/primary_button.dart
import 'package:dating_app/core/theme/dating_app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });
  final String text;
  final AsyncCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final bg = context.datingAppColor.primaryBrandColor;
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(text,
                style: TextStyle(
                    fontSize: 15,
                    color: context.datingAppColor.antiFlashWhite)),
      ),
    );
  }
}
