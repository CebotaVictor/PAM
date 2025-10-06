import 'package:flutter/material.dart';
import 'action_card.dart';

class WidgetSection extends StatelessWidget {
  const WidgetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ActionCardWidget(
            title: 'Book Appointment',
            imageUrl: 'booking.png',
            width: 150,
            height: 127,
          ),
          ActionCardWidget(
            title: 'Instant Video Consult',
            imageUrl: 'consult.png',
            width: 150,
            height: 127,
          ),
        ],
      ),
    );  
  }
}
