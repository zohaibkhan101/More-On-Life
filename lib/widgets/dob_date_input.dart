import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final ValueChanged<String> onDateSelected;
  final String selectedDate; // Add a property to display the current date

  const DateInput({
    super.key,
    required this.onDateSelected,
    required this.selectedDate, // Require the selectedDate
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Show a date picker when the user taps on the input
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          // Format the date as DD/MM/YYYY
          final formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          onDateSelected(formattedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate.isNotEmpty
                  ? selectedDate
                  : 'Select Date of Birth', // Show selected date or placeholder
              style: TextStyle(
                color: selectedDate.isNotEmpty ? Colors.black : Colors.grey,
                fontSize: 16,
              ),
            ),
            const Icon(Icons.calendar_today, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
