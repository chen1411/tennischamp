import 'package:flutter/material.dart';

class RewardBadge extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  RewardBadge({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}