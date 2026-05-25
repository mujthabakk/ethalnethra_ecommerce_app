import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom Dropdown Widget
/// Used for zone and area selection
class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final String hint;
  final List<String> items;
  final Map<String, String>? itemLabels;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    this.value,
    required this.hint,
    required this.items,
    this.itemLabels,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF7C7C7C),
            height: 29 / 16,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          isExpanded: true,
          initialValue: value != null && items.contains(value) ? value : null,
          hint: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFB1B1B1),
              height: 29 / 18,
              letterSpacing: 0,
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF7C7C7C),
            size: 24,
          ),
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xFF181725),
            height: 29 / 18,
            letterSpacing: 0,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 1),
            ),
          ),
          selectedItemBuilder: (context) {
            return items.map((item) {
              final displayLabel = itemLabels?[item] ?? item;
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  displayLabel,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF181725),
                    height: 29 / 18,
                    letterSpacing: 0,
                  ),
                ),
              );
            }).toList();
          },
          items: items.map((item) {
            final displayLabel = itemLabels?[item] ?? item;
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                displayLabel,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF181725),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
