import 'package:lab2/Repository/main_repository.dart';

import 'action_card.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';



class CardActionUpperWidget extends StatelessWidget {
  final MainRepository repository;
  const CardActionUpperWidget({super.key, required this.repository});
final double cardWidth = 180.0;
  final double cardHeight = 120.0;
  // Define consistent spacing between the cards
  final double spacing = 20.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // The outer vertical padding remains
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 12.0),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: repository.loadActionWithTwoWidgetsData(),
        builder: (context, snapshot) {
          // --- State Management (Waiting, Error, Data checks remain the same) ---
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(height: cardHeight, child: const Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return SizedBox(height: cardHeight, child: const Center(child: Text('Data failed to load or is empty.')));
          }
          
          final List<Map<String, dynamic>> actionsData = snapshot.data!;
          
          // --- Scrollable Content ---
          return Padding(
            // 1. Apply the fixed boundary padding to the parent container
            padding: EdgeInsets.symmetric(horizontal: spacing), 
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // Use Clip.none to ensure no clipping if items slightly overflow boundaries (though unlikely here)
              clipBehavior: Clip.none, 
              child: Row(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  // 2. Map data and apply dynamic padding for alignment
                  ...actionsData.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final Map<String, dynamic> action = entry.value;

                    // Calculate right padding: spacing for all but the last item
                    final double rightPadding = index < actionsData.length - 1 ? spacing : 0.0; 
                    
                    return Padding(
                      // Only apply padding on the right for internal spacing
                      padding: EdgeInsets.only(right: rightPadding), 
                      child: ActionCardWidget(
                        title: action['title'] as String,
                        imageUrl: action['image'] as String, 
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    );
                  }),
                  // REMOVE the previous const SizedBox(width: 0), as spacing is now controlled in the map.
                ],
              ),
            ),
          );
        },
      ),
    );  
  }
}