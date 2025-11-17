import 'package:lab2/list_items/nav_bar_list_item.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:lab2/models/main_page/UserModel.dart';
import 'dart:convert';
import '../resources/app_icons.dart';


Future<Usermodel?> loadUserData() async {
  try {
    // Read the file content as a string
    final String jsonString = await rootBundle.loadString('resources/json/medicineFeed.json');
    
    // Decode the JSON string into a Dart Map
    final Map<String, dynamic> decodedData = json.decode(jsonString);
    // Extract the list of actions from the 'actions' key
    final Map<String, dynamic>? userDataMap = decodedData['user'] as Map<String, dynamic>?;
    
    if(userDataMap != null){
      return Usermodel.fromJson(userDataMap);
    }

    return null;
  
  } catch (e) {
    // Log the error and return an empty list on failure
    debugPrint('Error loading JSON data: $e');
    return Usermodel(name: 'User Name', location: 'Location Unknown', imageUrl: '');
  }
}



class TopNavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBarWidget({super.key, required this.item});

  final NavBarListItem item; // Placeholder variable as per original code

  @override
  Widget build(BuildContext context) {
    // The FutureBuilder now wraps the core Row logic
    return FutureBuilder<Usermodel?>(
      future: loadUserData(),
      builder: (context, snapshot) {
        
        // --- 1. State Handling ---
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a minimal, sized container while loading
          return Container(
            height: preferredSize.height,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        final Usermodel? user = snapshot.data;

        if (snapshot.hasError || !snapshot.hasData) {
          // Return a static error/default state 
          // We will use default/placeholder text if data is unavailable
          debugPrint('Error or empty data: ${snapshot.error}');
        }

        final name = user?.name ?? 'User Name';
        final location = user?.location ?? 'Location Unknown';
        final profileImageUrl = user?.imageUrl; // Access the imageUrl property

        // --- 3. Content Rendering (Always returns a widget) ---
        return Container (
          // Adjusted the main container's margin for better AppBar appearance
          margin: const EdgeInsets.only(top: 1.0, bottom: 16.0), 
          height: preferredSize.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Section (Avatar and Text Data)
              Row(
                children: [
                  Container(
                    // Removed extra bottom margin from the avatar
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0), 
                    // Using the placeholder avatar
                    child: profileImageUrl != null
                        ? CircleAvatar( // Use CircleAvatar for remote images
                            radius: 20, 
                            backgroundImage: NetworkImage(profileImageUrl),
                          )
                        : AppIcons.newDoctorAvatarIcon, // Fallback if URL is null
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center text vertically
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Using dynamic data for Name/Location
                      Text(
                        name, // Dynamic Data Field 1
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        location, // Dynamic Data Field 2
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              // Right Section (Notification Icon)
              Padding(
                padding: const EdgeInsets.only(right: 10.0), // Add padding to align
                child: IconButton( 
                  icon: const Icon(Icons.notifications_none, size: 30, color: Colors.black54),
                  onPressed: () {
                    // Mock notification action
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  // Implements PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}