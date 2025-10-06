import 'package:flutter/material.dart';

//widged for dysplaing action card with image and title

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
          child: SizedBox(
            width: width, 
            height: height, 
            child: Column(
              children: [
                // 1. Image Area
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      'resources/images/$imageUrl',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                // 2. Text Area 
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
                          fontSize: 1,
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