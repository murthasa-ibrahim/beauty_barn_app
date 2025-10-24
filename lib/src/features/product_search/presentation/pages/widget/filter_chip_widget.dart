
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final IconData? icon;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        avatar:
            icon != null ? Icon(icon, size: 18, color: Colors.black54) : null,
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        shadowColor: Colors.grey.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        onPressed: () {
         context.push(Routes.filter);
        },
      ),
    );
  }
}