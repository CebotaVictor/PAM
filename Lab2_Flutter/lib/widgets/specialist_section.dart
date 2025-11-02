import 'package:flutter/material.dart';
import 'specialists_action_with_icon.dart';

class SpecialistSection extends StatelessWidget {
  const SpecialistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          
          Padding(
          
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
          
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: const [
                Text(
                  'Specialists',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'View all >',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ActionCardFigureWidget( 
                title: 'General Practitioners',
                imageUrl: 'booking.png',
                width: 150,
                height: 127,
              ),
              ActionCardFigureWidget(
                title: 'General Practitioners',
                imageUrl: 'consult.png',
                width: 150,
                height: 127,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
