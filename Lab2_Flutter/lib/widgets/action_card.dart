import 'package:flutter/material.dart';

class ActionCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl; // Path to the image asset
  final double width;
  final double height;
  const ActionCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.width,
    required this.height,

  });

  @override
  Widget build(BuildContext context) {
    // Wrap the Card in Padding to apply the OUTSIDE MARGIN
    return Padding(
      // Apply horizontal spacing around the card
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: width, // Fixed width
            height: height, // Fixed height
            child: Column(
              children: [
                // 1. Image Area
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      'lab2/resources/images/$imageUrl',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                // 2. Text Area (Applied minimal inner padding if needed, otherwise leave as Center)
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0), // Added INNER Padding
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}