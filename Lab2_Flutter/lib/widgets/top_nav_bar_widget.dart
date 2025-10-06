import 'package:flutter/material.dart';
import 'package:lab2/list_items/nav_bar_list_item.dart';
import 'package:lab2/resources/app_colors.dart';
import 'package:lab2/resources/strings.dart';

import '../resources/app_icons.dart';

// class TopNavBarWidget extends StatelessWidget {
//   const TopNavBarWidget({super.key, required this.item});

//   final NavBarListItem item;

//   //explain me all these propertyes 


//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the cross axis (left side in LTR languages)
//           children: [
//             Text(Strings.location, style: TextStyle(color: AppColors.neutral650, fontSize: 14)),
//             Text(item.location, style: TextStyle(color: AppColors.neutral950, fontSize: 14)),
//           ],
//         ),
//         Expanded(child: Container()), // This takes up all the remaining space in the row
//         AppIcons.notificationIcon, // Notification icon on the right
//       ],
//     );
//   }
// }



class TopNavBarWidget extends StatelessWidget {
  const TopNavBarWidget({super.key, required this.item});

  final NavBarListItem item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Hardcoded placeholder avatar
            AppIcons.avatarIcon,
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location', // Hardcoded Name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Chisinau, Moldova', // Hardcoded Location
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, size: 30, color: Colors.black54),
          onPressed: () {
            // Mock notification action
          },
        ),
      ],
    );
  }
}