import 'package:flutter/material.dart';


class LocationCard extends StatelessWidget {
  final String city;
  final String address;

  const LocationCard({super.key, 
    required this.city,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text(
            city,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
           address, 
            style: TextStyle(
              fontSize: 10,
              color:Colors.grey.shade600,
              fontWeight:FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}