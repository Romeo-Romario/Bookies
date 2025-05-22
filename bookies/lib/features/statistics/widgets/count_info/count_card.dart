import 'package:bookies/features/shared/theme/theme_extension.dart';
import 'package:flutter/material.dart';

class CountCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;

  const CountCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: context.colorScheme.primary,
    );
    final countStyle = context.textTheme.bodyMedium?.copyWith(
      color: context.colorScheme.secondary,
    );

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          children: [
            Icon(icon, color: context.colorScheme.primary),
            Text(title, style: titleStyle),
            Text(count.toString(), style: countStyle)
          ],
        ),
      ),
    );
  }
}
