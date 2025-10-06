import 'package:flutter/material.dart';
import 'action_card_with_icon.dart';

class SpecialistSection extends StatelessWidget {
  const SpecialistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // This padding adds vertical space above and below the section,
      // and no horizontal space, effectively centering the content.
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
        children: [
          // Header Row
          Padding(
            // This padding adds horizontal space on the left and right sides of the header.
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              // This row contains the header and the "View all" text.
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the two texts
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

          // This SizedBox adds vertical space between the header and the card row.

          const SizedBox(height: 12),

          // Card Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ActionCardFigureWidget( // Custom widget for the action card
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
