import 'package:flutter/material.dart';
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
            children: const [
              SpecialtyItem(
                title: 'Eye Specialist',
                imagePath: 'lab/assets/images/eye.png',
              ),
              SizedBox(width: 12),
              SpecialtyItem(
                title: 'Dentist',
                imagePath: 'lab/assets/images/tooth.png',
              ),
              SizedBox(width: 12),
              SpecialtyItem(
                title: 'Cardiologist',
                imagePath: 'lab/assets/images/heart.png',
              ),
              SizedBox(width: 12),
              SpecialtyItem(
                title: 'Pulmonologist',
                imagePath: 'lab/assets/images/lung.png',
              ),
              SizedBox(width: 12),
              SpecialtyItem(
                title: 'Physician',
                imagePath: 'lab/assets/images/stethoscope.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
