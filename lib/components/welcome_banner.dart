import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  final String username;

  const WelcomeBanner({super.key, this.username = 'Guest'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Colors.purple.shade900,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back, $username',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage your vehicles and access repair documentation',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.yellow.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
