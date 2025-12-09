import 'package:flutter/material.dart';

class SpecialistAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SpecialistAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.star_border, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}