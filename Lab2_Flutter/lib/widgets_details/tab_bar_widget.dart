import 'package:flutter/material.dart';
import 'package:lab2/Repository/profile_repository.dart';


// --- 2. The Wrapper Widget (Handles Loading) ---
class TabBarSection extends StatelessWidget {
  final ProfileRepository profileRepository;
  const TabBarSection({super.key, required this.profileRepository});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: FutureBuilder<List<String>>(
        future: profileRepository.loadTabBarData(),
        builder: (context, snapshot) {
          // State 1: Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 60, // Fixed height to prevent layout jump
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          // State 2: Error or Empty
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Container(
              height: 60,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                 color: Colors.grey.shade100,
                 borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(child: Text('Failed to load tabs')),
            );
          }

          // State 3: Success
          // Pass the loaded list of strings to your SegmentedTabBar
          return SegmentedTabBar(labels: snapshot.data!);
        },
      ),
    );
  }
}

// --- 3. Your SegmentedTabBar Widget ---
// (Kept exactly as you provided, with minor cleanup)
class SegmentedTabBar extends StatefulWidget {
  final List<String> labels;

  const SegmentedTabBar({
    super.key,
    required this.labels,
  }) : assert(labels.length >= 2, 'SegmentedTabBar must have at least two labels.');

  @override
  State<SegmentedTabBar> createState() => _SegmentedTabBarState();
}

class _SegmentedTabBarState extends State<SegmentedTabBar> {
  int _selectedIndex = 0;

  Widget _buildTabItem(int index, String label) {
    bool isSelected = index == _selectedIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
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
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // This maps the list of strings dynamically to widgets
        children: widget.labels.asMap().entries.map((entry) {
          return _buildTabItem(entry.key, entry.value);
        }).toList(),
      ),
    );
  }
}