import 'package:data_layer/models/main_page/specialist.dart';
import 'package:flutter/material.dart';
import 'package:lab2/Repository/main_repository.dart';
import 'specialists_action_with_icon.dart';



class SpecialistSection extends StatelessWidget {
  final MainRepository repository;
  final double cardWidth = 150.0;
  final double cardHeight = 127.0;
  final double spacing = 10.0; // Space between the two cards
  const SpecialistSection({super.key, required this.repository});
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

          
         // Dynamic List Content
          FutureBuilder<List<SpecialistList>>(
            future: repository.loadSpecialistsData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Specialist data unavailable.'));
              }

              final List<SpecialistList> specialists = snapshot.data!;

              // We only want the first two specialists
              // 🎯 FIX: Use a fixed height SizedBox to constrain the horizontal ListView
                return SizedBox(
                  height: cardHeight, // Use the height of a single card (127.0)
                  child: ListView.separated(
                    // 1. Enable Horizontal Scrolling
                    scrollDirection: Axis.horizontal,
                    
                    // 2. Padding only on the left and right edges
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                    
                    itemCount: specialists.length, // Include ALL loaded items
                    
                    // Use separatorBuilder for spacing BETWEEN items
                    separatorBuilder: (context, index) => const SizedBox(width: 15.0), 
                    
                    itemBuilder: (context, index) {
                      final item = specialists[index];
                      
                      return SpecialistsActionWithIcon(
                        id: item.id,
                        name: item.name,
                        specialty: item.specialty,
                        rating: item.rating.toInt(), 
                        available: (item.available!=null) ? 1 : 0,
                        imagePath: item.imagePath, 
                        width: cardWidth,
                        height: cardHeight, // Use the full height of the parent SizedBox
                      );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}