import 'package:flutter/material.dart';

class SubjectChip extends StatelessWidget {
  final String subject;

  const SubjectChip({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF4D6EFF).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        subject,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF4D6EFF),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
