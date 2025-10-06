import 'package:flutter/material.dart';

class AppointmentBookingSection extends StatelessWidget {
  const AppointmentBookingSection({super.key});

  Widget _buildHospitalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Evercare Hospital Ltd.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Boshundhora, Dhaka',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                '2 More clinic',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '20 mins or less wait time',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0), 
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide.none, 
          left: BorderSide(color: Colors.grey.shade400, width: 1),
          right: BorderSide(color: Colors.grey.shade400, width: 1),
          bottom: BorderSide(color: Colors.grey.shade400, width: 1), 
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: _buildHospitalDetails(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const DateSelectionTabs(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const TimeSlotSelector(),
          ),
        ],
      ),
    );
  }
}

class DateSelectionTabs extends StatefulWidget {
  const DateSelectionTabs({super.key});

  @override
  State<DateSelectionTabs> createState() => _DateSelectionTabsState();
}

class _DateSelectionTabsState extends State<DateSelectionTabs> {
  int _selectedDateIndex = 1;

  Widget _buildDateTab(int index, String label, String? slotInfo) {
    bool isSelected = index == _selectedDateIndex;
    Color activeColor = Colors.teal;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDateIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? activeColor : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black87 : Colors.grey.shade600,
              ),
            ),
            if (slotInfo != null)
              Text(
                slotInfo,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? activeColor : Colors.grey.shade500,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateTab(0, 'Today', '(No Slot)'),
        _buildDateTab(1, 'Tomorrow', '(20 Slot)'),
        _buildDateTab(2, '17 Oct', '(10 Slot)'),
      ],
    );
  }
}

class TimeSlotSelector extends StatefulWidget {
  const TimeSlotSelector({super.key});

  @override
  State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  String? _selectedTimeSlot;

  final List<String> timeSlots = [
    '06:00 - 06:30',
    '06:30 - 07:00',
    '07:00 - 07:30',
    '07:30 - 08:00',
    '08:00 - 08:30',
  ];

  Widget _buildTimeSlotButton(String slot) {
    bool isSelected = _selectedTimeSlot == slot;
    Color borderColor = isSelected ? Colors.teal : Colors.grey.shade400;
    Color textColor = isSelected ? Colors.teal : Colors.black87;
    Color fillColor = isSelected ? Colors.teal.withOpacity(0.1) : Colors.transparent;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeSlot = slot;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0), 
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Text(
          slot,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20), // 👈 margin outside
      child: SizedBox(
        height: 60,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: timeSlots.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            return _buildTimeSlotButton(timeSlots[index]);
          },
        ),
      ),
    );
  }
}
