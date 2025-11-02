import 'package:flutter/material.dart';
import 'package:lab2/resources/app_icons.dart';
import 'package:lab2/widgets/speciality_circle_widget.dart';

class SpecialtyListSection extends StatelessWidget {
  const SpecialtyListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Text(
            'Specialities most relevant to you',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children:  [
              // SpecialtyItem(
              //   title: 'Eye Specialist',
              //   appIcon: AppIcons.eyeIcon,
              // ),
              // SizedBox(width: 12),
              // SpecialtyItem(
              //   title: 'Dentist',
              //   appIcon: AppIcons.toothIcon,
              // ),
              // SizedBox(width: 12),
              // SpecialtyItem(
              //   title: 'Cardiologist',
              //   appIcon: AppIcons.heartIcon,
              // ),
              // SizedBox(width: 12),
              // SpecialtyItem(
              //   title: 'Pulmonologist',
              //   appIcon: AppIcons.lungsIcon,
              // ),
              // SizedBox(width: 12),
              // SpecialtyItem(
              //   title: 'Physician',
              //   appIcon: AppIcons.stethoscopeIcon,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
