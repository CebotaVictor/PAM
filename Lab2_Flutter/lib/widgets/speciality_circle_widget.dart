import 'package:flutter/material.dart';

class SpecialtyItem extends StatelessWidget {
  final String title;
  final Widget appIcon;

  const SpecialtyItem({
    super.key,
    required this.title,
    required this.appIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade50,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: appIcon,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
