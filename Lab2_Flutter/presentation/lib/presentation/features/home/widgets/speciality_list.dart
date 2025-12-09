import 'package:flutter/material.dart';
import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:presentation/presentation/features/home/widgets/speciality_circle_widget.dart';

class SpecialtyListSection extends StatelessWidget {
  final List<SpecialtyEntity> specialties;

  const SpecialtyListSection({
    super.key,
    required this.specialties,
  });

  @override
  Widget build(BuildContext context) {
    if (specialties.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Specialities most relevant to you',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: specialties.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = specialties[index];
              
              return SpecialtyItem(
                id: item.id,
                name: item.name,
                iconUrl: item.imagePath,
              );
            },
          ),
        ),
      ],
    );
  }
}