// lib/features/user/presentation/widgets/profile_header.dart
import 'package:flutter/material.dart';
import 'package:dating_app/core/theme/dating_app_color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    required this.name,
    required this.id,
    required this.photoUrl,
    required this.onAddPhoto,
    super.key,
  });
  final String name;
  final String id;
  final String photoUrl;
  final VoidCallback onAddPhoto;

  @override
  Widget build(BuildContext context) {
    final colors = context.datingAppColor;
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(photoUrl),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'ID: $id',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          width: 125,
          child: ElevatedButton(
            onPressed: onAddPhoto,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary700,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Fotoğraf Ekle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
