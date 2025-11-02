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
        mainAxisAlignment: MainAxisAlignment.center, 
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
    child: IntrinsicHeight( 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch, 
        children: [

          _buildStatItem(
            icon: Icons.star,
            iconColor: Colors.amber,
            value: rating.toStringAsFixed(1),
            label: 'Rating & Review',
          ),

          const VerticalDivider(
            color: Color(0xFFE0E0E0),
            thickness: 1,
            width: 20,
          ),

          _buildStatItem(
            icon: Icons.work_outline,
            iconColor: Colors.teal,
            value: yearsOfWork.toString(),
            label: 'Years of work',
          ),

          const VerticalDivider(
            color: Color(0xFFE0E0E0),
            thickness: 1,
            width: 20,
          ),

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
