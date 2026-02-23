import 'package:flutter/material.dart';
import '../pages/search_page.dart';
import '../pages/documents_page.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavigation;
  final VoidCallback onLogout;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onNavigation,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 8,
      color: Colors.purple.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Logo / Home
          Tooltip(
            message: 'Home',
            child: IconButton(
              onPressed: () => onNavigation(0),
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                size: 28,
              ),
            ),
          ),
          // Documents
          Tooltip(
            message: 'Documents',
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DocumentsPage()),
                );
                onNavigation(1);
              },
              icon: Icon(
                Icons.description,
                color: currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                size: 28,
              ),
            ),
          ),
          // Search - Hidden for now
          // Tooltip(
          //   message: 'Search',
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.of(
          //         context,
          //       ).push(MaterialPageRoute(builder: (_) => const SearchPage()));
          //       onNavigation(2);
          //     },
          //     icon: Icon(
          //       Icons.search,
          //       color: currentIndex == 2
          //           ? Theme.of(context).colorScheme.primary
          //           : Colors.grey,
          //       size: 28,
          //     ),
          //   ),
          // ),
          // Logout
          Tooltip(
            message: 'Logout',
            child: IconButton(
              onPressed: onLogout,
              icon: const Icon(Icons.logout, color: Colors.red, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
