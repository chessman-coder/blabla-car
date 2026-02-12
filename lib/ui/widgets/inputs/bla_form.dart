import 'package:flutter/material.dart';

class BlaForm extends StatelessWidget {
  final String departureLocation;
  final String arrivalLocation;
  final String dateTime;
  final int user;
  const BlaForm({
    super.key,
    required this.departureLocation,
    required this.arrivalLocation,
    required this.dateTime,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(Icons.radio_button_unchecked, departureLocation, Icons.swap_vert),
          const Divider(),
          _buildRow(Icons.radio_button_unchecked, arrivalLocation, null),
          const Divider(),
          _buildRow(Icons.calendar_today, dateTime, null),
          const Divider(),
          _buildRow(Icons.person_outline, user.toString(), null),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00AEEF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Search",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String text, IconData? trailingIcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
          if (trailingIcon != null) Icon(trailingIcon, color: Colors.grey),
        ],
      ),
    );
  }
}
