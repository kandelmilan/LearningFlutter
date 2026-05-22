import 'package:flutter/material.dart';
import 'package:hello_world/views/home/screen/components/stat_card.dart';

class StatCardSection extends StatelessWidget {
  const StatCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatCard(
          icon: '✓',
          value: '84%',
          label: 'Accuracy',
          bgColor: Colors.green.shade50,
          textColor: Colors.green,
        ),
        const SizedBox(width: 12),
        StatCard(
          icon: '🔥',
          value: '12',
          label: 'Day\nStreak',
          bgColor: Colors.orange.shade50,
          textColor: Colors.orange,
        ),
        const SizedBox(width: 12),
        StatCard(
          icon: '🏆',
          value: '48',
          label: 'Levels',
          bgColor: Colors.purple.shade50,
          textColor: Colors.purple,
        ),
        const SizedBox(width: 12),
        StatCard(
          icon: '🕐',
          value: '18h',
          label: 'Weekly',
          bgColor: Colors.blue.shade50,
          textColor: Colors.blue,
        ),
      ],
    );
  }
}
