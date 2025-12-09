import 'package:flutter/material.dart';
import 'package:presentation/presentation/features/home/widgets/favorite_icon_widget.dart';


class SpecialistsActionWithIcon extends StatelessWidget {
  final int? id;
  final String? name;
  final String? specialty;
  final double rating;
  final int? available;
  final String? imagePath;
  final double width;
  final double height;

  const SpecialistsActionWithIcon({
    super.key,
    this.id,
    required this.name,
    this.imagePath,
    required this.specialty,
    required this.rating,
    required this.available,
    required this.width,
    required this.height,
  });

  // SpecialistsActionWithIcon widget
// ... (The class properties remain the same)

@override
Widget build(BuildContext context) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        width: width, 
        height: height, 

        child: Column( 
          children: [
            // 1. Image Area (Fixed Size)
            SizedBox(
              // Using a fixed fraction of the total height
              height: height * 0.66, 
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Stack(
                  fit: StackFit.expand, 
                  children: [
                    Image.network(
                      imagePath ?? '', // Assuming this is an Asset path
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 8,
                      left: 8,
                      child: FavoriteIcon(), // Assuming this widget exists
                    ),
                  ],
                ),
              ),
            ),

            // 2. Text Area (Expanded to fill remaining space)
            Expanded( // Now works correctly inside the Column
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0), 
                  child: Text(
                    name ?? "name",
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
  );
}
}