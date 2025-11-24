import 'package:flutter/material.dart';

class SpecialtyItem extends StatelessWidget {
  final String? name;
  final String? iconUrl;
  final int? id;

  const SpecialtyItem({
    super.key,
    required this.name,
    required this.iconUrl,
    this.id,
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            // Use Image.network for the URL icon
            child: Image.network(
              iconUrl ?? '',
              fit: BoxFit.contain, // Ensure the icon fits within the padding
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 70, // Constrain width for consistent wrapping
          child: Text(
            name ?? '',
            textAlign: TextAlign.center,
            maxLines: 4, // Allow text to wrap if necessary
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}