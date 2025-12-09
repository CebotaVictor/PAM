import 'package:flutter/material.dart';
import 'package:domain/Entities/main_page/user_entity.dart';
// import 'package:presentation/presentation/features/home/list_items/list_items_home/nav_bar_list_item.dart'; // Import Entity

class TopNavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  // Pass the USER entity directly
  final UserEntity? user; 
  final String fallbackLocation;

  const TopNavBarWidget({
    super.key, 
    required this.user, 
    this.fallbackLocation = 'Location Unknown'
  });

  @override
  Widget build(BuildContext context) {
    final name = user?.name ?? 'Guest';
    final location = user?.location ?? fallbackLocation;
    final profileImageUrl = user?.imageUrl;

    return Container (
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
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0), 
                child: profileImageUrl != null && profileImageUrl.isNotEmpty
                    ? CircleAvatar(
                        radius: 20, 
                        backgroundImage: NetworkImage(profileImageUrl),
                      )
                    : const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton( 
              icon: const Icon(Icons.notifications_none, size: 30, color: Colors.black54),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}