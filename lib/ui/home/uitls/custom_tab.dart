import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color strokeColor;
  final String text;
  final Color? labelColor;

  const CustomTab({
    super.key,
    required this.icon,
    this.iconColor,
    required this.strokeColor,
    required this.text,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: strokeColor, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: labelColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
