import 'package:flutter/material.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/search_bar_list_item.dart';


class SearchBarWidget extends StatelessWidget {
  // final TextEditingController _searchController = TextEditingController();

  const SearchBarWidget({super.key, required this.item});

  final SearchBarListItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.blueGrey, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    // controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.blueGrey.shade300),
                      border: InputBorder.none, // Removes the default underline
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 10),

        SizedBox(
          height: 50,
          width: 50,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Center(
              child: Icon(Icons.layers_outlined, color: Colors.blueGrey, size: 24),
            ),
          ),
        ),
      ],
    );
  }
}