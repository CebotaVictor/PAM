import 'package:flutter/material.dart';
import 'action_card.dart';


class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ActionCardWidget(
            title: 'Medicines',
            imageUrl: 'booking.png',
            width: 105,
            height: 102,
          ),
          ActionCardWidget(
            title: 'Lab Tests',
            imageUrl: 'booking.png',
            width: 105,
            height: 102,
          ),
          ActionCardWidget(
            title: 'Emergency',
            imageUrl: 'booking.png',
            width: 105,
            height: 102,
          ),
        ],
      ),
    );  
  }
}
