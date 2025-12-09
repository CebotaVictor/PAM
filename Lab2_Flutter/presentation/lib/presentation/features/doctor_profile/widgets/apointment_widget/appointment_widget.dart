
import 'package:data_layer/models/profile_page/clinic/available_day.dart';
import 'package:data_layer/models/profile_page/clinic/clinic.dart';
import 'package:domain/Entities/profile_page/clinic/available_day_entity.dart';
import 'package:domain/Entities/profile_page/clinic/hospital_section_appointment_entity.dart';
import 'package:flutter/material.dart';

class AppointmentBookingSection extends StatefulWidget {
  final AppointmentEntity appointment;
  final List<AvailableDayEntity> availableDays;

  const AppointmentBookingSection({
    super.key,
    required this.appointment,
    required this.availableDays,
  });

  @override
  State<AppointmentBookingSection> createState() =>
      _AppointmentBookingSectionState();
}

class _AppointmentBookingSectionState extends State<AppointmentBookingSection> {
  int _selectedDateIndex = 0;
  String? _selectedTimeSlot;

  @override
  void initState() {
    super.initState();
    // Pre-select the first available day, or -1 if none
    _selectedDateIndex =
        widget.availableDays.indexWhere((day) => day.slots.isNotEmpty);
    if (_selectedDateIndex == -1) {
      _selectedDateIndex = 0; // Default to first day if all are empty
    }
  }

  /// Shows a modal bottom sheet with a list of other clinic locations.
  void _showMoreClinics(BuildContext context, List<Clinic> clinics) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to be a custom height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext sheetContext) {
        // DraggableScrollableSheet provides a nice, resizable modal
        return DraggableScrollableSheet(
          expand: false, // Sheet will not expand to full screen
          initialChildSize: 0.4, // Start at 40% of screen height
          minChildSize: 0.3, // Can be dragged down to 30%
          maxChildSize: 0.6, // Can be dragged up to 60%
          builder: (context, scrollController) {
            return Column(
              children: [
                // "Drag handle" for the bottom sheet
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text(
                  "Other Clinic Locations",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Divider(height: 20),
                // The scrollable list of clinics
                Expanded(
                  child: ListView.separated(
                    controller: scrollController, // Important for scrolling
                    itemCount: clinics.length,
                    separatorBuilder: (_, __) =>
                        const Divider(indent: 16, endIndent: 16),
                    itemBuilder: (context, index) {
                      final clinic = clinics[index];
                      return ListTile(
                        leading:
                            Icon(Icons.location_on_outlined, color: Colors.teal),
                        title: Text(clinic.name,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(clinic.location,
                            style: TextStyle(color: Colors.grey.shade600)),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Gracefully handle if the list is empty or index is out of bounds
    final AvailableDayEntity? selectedDay =
        (widget.availableDays.isNotEmpty &&
                _selectedDateIndex < widget.availableDays.length)
            ? widget.availableDays[_selectedDateIndex]
            : null;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide.none,
          left: BorderSide(color: Colors.grey.shade400, width: 1),
          right: BorderSide(color: Colors.grey.shade400, width: 1),
          bottom: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.appointment.hospitalName ?? "Evercare Hospital Ltd.",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget.appointment.hospitalLocation ?? "Bashundhara, Dhaka",
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                    if (widget.appointment.moreClinics.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          // Call the modal sheet function
                          _showMoreClinics(
                              context, widget.appointment.moreClinics);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            '${widget.appointment.moreClinics.length} More clinic${widget.appointment.moreClinics.length > 1 ? 's' : ''}',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.appointment.waitTime ?? "20 mins or less",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
          const Divider(height: 0, thickness: 1),

          // --- Date Tabs ---
          SizedBox(
            height: 70, // Increased height for better tap area and spacing
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              itemCount: widget.availableDays.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                final day = widget.availableDays[index];
                final isSelected = index == _selectedDateIndex;
                final bool hasSlots = day.slots.isNotEmpty;

                return GestureDetector(
                  onTap: () {
                    // Allow tapping only if there are slots, or for selection visual
                    setState(() {
                      _selectedDateIndex = index;
                      _selectedTimeSlot = null; // Reset time on date change
                    });
                  },
                  child: Container(
                    width: 120, // Fixed width for alignment
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          day.day,
                          style: TextStyle(
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 10,
                            color: isSelected ? Colors.black87 : (hasSlots ? Colors.grey.shade800 : Colors.grey.shade400),
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (hasSlots)
                          Text(
                            '${day.slots.length} Slot${day.slots.length > 1 ? 's' : ''}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.teal : Colors.grey.shade600,
                            ),
                          )
                        else
                          Text(
                            'No Slot',
                            style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.grey.shade500 : Colors.grey.shade400),
                          ),
                        const Spacer(), // Pushes the underline to the bottom
                        if (isSelected)
                          Container(
                            height: 2,
                            width: 40,
                            color: Colors.teal,
                          )
                        else
                           Container(height: 2, width: 40, color: Colors.transparent), // maintain space
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          // --- Time Slots ---
          if (selectedDay != null && selectedDay.slots.isNotEmpty)
            SizedBox(
              height: 50, // Fixed height for the time slot list
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: selectedDay.slots.length,
                separatorBuilder: (_, __) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final slot = selectedDay.slots[index];
                  final isSelected = _selectedTimeSlot == slot;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTimeSlot = slot;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.teal
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: isSelected
                                ? Colors.teal
                                : Colors.grey.shade400,
                            width: 1.5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        slot,
                        style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            // Show a message if no slots are available for the selected day
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "No slots available for this day.",
                style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
              ),
            ),
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }
}