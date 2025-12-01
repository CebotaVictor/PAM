// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;

import 'package:lab2/Repository/main_repository.dart';

import 'action_card.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';



class CardActionLowerWidget extends StatelessWidget {
  final MainRepository repository;
  const CardActionLowerWidget({super.key, required this.repository});


  final double cardWidth = 120.0;
  final double cardHeight = 120.0;
  final double spacing = 10.0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 12.0),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: repository.loadActionWithThreeWidgetsData(),
        builder: (context, snapshot) {  
          // --- State Management ---
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loader while the file is being read
            return SizedBox(
              height: cardHeight, // Give it a fixed height to prevent layout jump
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            // Display an error or placeholder if loading fails or data is empty
            return SizedBox(
              height: cardHeight,
              child: const Center(child: Text('Data failed to load or is empty.')),
            );
          }
          
          // Data is successfully loaded
          final List<Map<String, dynamic>> actionsData = snapshot.data!;
          
          // --- Scrollable Content ---
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            // Apply padding only to the outside of the scrollable area
            padding: const EdgeInsets.symmetric(horizontal: 16.0), 
            child: Row(
              // The main axis size is minimized, allowing content to scroll horizontally
              mainAxisSize: MainAxisSize.min, 
              children: [
                // Map the JSON data to a list of ActionCardWidget instances
                ...actionsData.map((action) {
                  // The card itself
                  return Padding(
                    // Apply spacing to the right of each card
                    padding: EdgeInsets.only(right: spacing), 
                    child: ActionCardWidget(
                      title: action['title'] as String,
                      // The 'image' key holds the URL in the JSON data
                      imageUrl: action['image'] as String, 
                      width: cardWidth,
                      height: cardHeight,
                    ),
                  );
                }),
                // Add an empty SizedBox at the end to ensure the last card has 
                // the correct padding/spacing after it.
                const SizedBox(width: 0),
              ],
            ),
          );
        },
      ),
    );
  }
}
