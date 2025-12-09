import 'package:flutter/material.dart';
import 'package:domain/Entities/main_page/specialist_entity.dart'; // Import Entity
import 'specialists_action_with_icon.dart';

class SpecialistSection extends StatelessWidget {
  // 1. Accept Data, NOT Repository
  final List<SpecialistListEntity> specialists;

  const SpecialistSection({super.key, required this.specialists});

  final double cardWidth = 150.0;
  final double cardHeight = 127.0;

  @override
  Widget build(BuildContext context) {
    if (specialists.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: const [
                Text(
                  'Specialists',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  'View all >',
                  style: TextStyle(fontSize: 14, color: Colors.teal, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 2. Render List directly (No FutureBuilder)
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0), 
              itemCount: specialists.length,
              separatorBuilder: (context, index) => const SizedBox(width: 15.0), 
              itemBuilder: (context, index) {
                final item = specialists[index];
                
                return SpecialistsActionWithIcon(
                  id: item.id,
                  name: item.name,
                  specialty: item.specialty,
                  rating: item.rating?.toDouble() ?? 0.0, 
                  available: (item.available == true) ? 1 : 0, // Handle boolean logic here or in Entity
                  imagePath: item.imagePath, 
                  width: cardWidth,
                  height: cardHeight,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}