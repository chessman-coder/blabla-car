import 'package:flutter/material.dart';

class BlaForm extends StatelessWidget {
  const BlaForm({super.key});

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
          _buildRow(Icons.radio_button_unchecked, "Toulouse", Icons.swap_vert),
          const Divider(),
          _buildRow(Icons.radio_button_unchecked, "Bordeaux, France", null),
          const Divider(),
          _buildRow(Icons.calendar_today, "Sat 22 Feb", null),
          const Divider(),
          _buildRow(Icons.person_outline, "1", null),

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
