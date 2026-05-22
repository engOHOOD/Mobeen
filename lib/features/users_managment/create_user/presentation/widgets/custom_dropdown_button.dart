import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String title;
  final String hintText;
  final String? value;
  final Map<String, String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropdownButton({
    Key? key,
    required this.title,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: value,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          isExpanded: true,
          elevation: 2,
          dropdownColor: Colors.white,
          style: const TextStyle(color: Colors.black87, fontSize: 15),

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),

          items: items.keys.map((String key) {
            return DropdownMenuItem<String>(
              value: items[key],
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(key),
              ),
            );
          }).toList(),

          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
