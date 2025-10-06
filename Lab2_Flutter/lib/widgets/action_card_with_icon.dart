import 'package:flutter/material.dart';
import 'package:lab2/widgets/favorite_icon_widget.dart';

//widget to 

class ActionCardFigureWidget extends StatelessWidget {
  final String title;
  final String imageUrl; // Path to the image asset
  final double width;
  final double height;
  const ActionCardFigureWidget({
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
        elevation: 3,
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
                SizedBox(
                  height: height * 0.66,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Stack(
                      fit: StackFit.expand, // ensures image fills the space
                      children: [
                        Image.asset(
                          'resources/images/$imageUrl',
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                          top: 8,
                          left: 8,
                          child: FavoriteIcon(),
                        ),
                      ],
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
                          fontSize: 14,
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