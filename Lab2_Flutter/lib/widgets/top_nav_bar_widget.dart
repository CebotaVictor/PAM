import 'package:flutter/material.dart';
import 'package:lab2/list_items/nav_bar_list_item.dart';
import 'package:lab2/resources/app_colors.dart';
import 'package:lab2/resources/strings.dart';

import '../resources/app_icons.dart';

class TopNavBarWidget extends StatelessWidget {
  const TopNavBarWidget({super.key, required this.item});

  final NavBarListItem item;
  @override
  Widget build(BuildContext context) {
    
    return Container (
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Hardcoded placeholder avatar
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0), 
              child: AppIcons.doctorAvatarIcon,
            ),
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
    ),
    );
  }
}