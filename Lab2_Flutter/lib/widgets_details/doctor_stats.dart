import 'package:flutter/material.dart';

class DoctorStatsRow extends StatelessWidget {
  final double rating;
  final int yearsOfWork;
  final int patientCount;

  const DoctorStatsRow({
    super.key,
    required this.rating,
    required this.yearsOfWork,
    required this.patientCount,
  });

  // Reusable widget for a single stat item
  Widget _buildStatItem({
  required IconData icon,
  required Color iconColor,
  required String value,
  required String label,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // center vertically
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    ),
  );
}

  
  @override
Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: IntrinsicHeight( // 👈 Add this wrapper
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch, // 👈 Stretch vertically
        children: [
          // 1. Rating & Review
          _buildStatItem(
            icon: Icons.star,
            iconColor: Colors.amber,
            value: rating.toStringAsFixed(1),
            label: 'Rating & Review',
          ),

          // Vertical Divider 1
          const VerticalDivider(
            color: Color(0xFFE0E0E0),
            thickness: 1,
            width: 20,
          ),

          // 2. Years of work
          _buildStatItem(
            icon: Icons.work_outline,
            iconColor: Colors.teal,
            value: yearsOfWork.toString(),
            label: 'Years of work',
          ),

          // Vertical Divider 2
          const VerticalDivider(
            color: Color(0xFFE0E0E0),
            thickness: 1,
            width: 20,
          ),

          // 3. No. of patients
          _buildStatItem(
            icon: Icons.group_outlined,
            iconColor: Colors.teal,
            value: patientCount.toString(),
            label: 'No. of patients',
          ),
        ],
      ),
    ),
  );
}



}

//does the contatiner is the same as a div in html
// A Container in Flutter is similar to a div in HTML in that it is a versatile widget used for layout and styling purposes. However, there are some differences in how they function and are used within their respective frameworks.
// Here are some key points of comparison:
// 1. Purpose:
//    - Container: In Flutter, a Container is a widget that can contain other widgets and is used for layout, styling, and positioning. It can have properties like padding, margin, borders, background color, and more.
//    - div: In HTML, a div is a block-level element used to group other HTML elements together. It is primarily used for layout and structuring content on a webpage.
// 2. Styling:
//    - Container: Flutter's Container widget allows you to apply various styles directly through its properties, such as color, border, borderRadius, boxShadow, etc.
//    - div: In HTML, styling is typically done using CSS (Cascading Style Sheets). You can apply styles to a div using inline styles, internal stylesheets, or external stylesheets.
// 3. Layout:
//    - Container: Flutter provides a rich set of layout widgets (like Row, Column, Stack, etc.) that can be used in conjunction with Container to create complex layouts.
//    - div: In HTML, layout is often managed using CSS properties like flexbox, grid, and positioning. Divs can be nested and styled to create various layouts.
// 4. Functionality:
//    - Container: In Flutter, a Container can also handle gestures and animations, making it more interactive.
//    - div: In HTML, a div itself does not handle interactions; instead, you would typically use JavaScript to add interactivity to elements within a div.