import 'package:flutter/material.dart';
import 'package:lab2/widgets/favorite_icon_widget.dart';


class ActionCardFigureWidget extends StatelessWidget {
  final int? id;
  final String name;
  final String specialty;
  final int rating;
  final int available;
  final String? imagePath;
  final double width;
  final double height;

  const ActionCardFigureWidget({
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

  @override
  Widget build(BuildContext context) {
    
    return Padding(
    
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
            child: ListView(
              children: [
                // 1. Image Area
                SizedBox(
                  height: height * 0.66,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Stack(
                      fit: StackFit.expand, 
                      children: [
                        Image.asset(
                          imagePath ?? '',
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

 
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0), 
                      child: Text(
                        name,
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