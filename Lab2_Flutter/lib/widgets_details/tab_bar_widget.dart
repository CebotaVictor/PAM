import 'package:flutter/material.dart';

class SegmentedTabBar extends StatefulWidget {
  final List<String> labels;
  

  // The state change logic is contained internally, as requested.
  const SegmentedTabBar({
    super.key,
    required this.labels,
  }) : assert(labels.length >= 2, 'SegmentedTabBar must have at least two labels.');

  @override
  State<SegmentedTabBar> createState() => _SegmentedTabBarState();
}

class _SegmentedTabBarState extends State<SegmentedTabBar> {
  int _selectedIndex = 0; // Default to the first tab

  // Sub-widget definition for a single tab item
  Widget _buildTabItem(int index, String label) {
    bool isSelected = index == _selectedIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Update the state only if a different tab is tapped
          if (!isSelected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          // Apply distinct styling based on selection state
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
            // Subtle shadow only for the active tab
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.black87 : Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Outer container for the overall light-grey rounded track
    return Container(
      margin: const EdgeInsets.all(16.0), // Outer spacing for the entire widget
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        borderRadius: BorderRadius.circular(15.0), // Outer rounded corners
      ),
      padding: const EdgeInsets.all(4.0), // Padding inside the track
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.labels.asMap().entries.map((entry) {
          return _buildTabItem(entry.key, entry.value);
        }).toList(),
      ),
    );
  }
}