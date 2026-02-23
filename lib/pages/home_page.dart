import 'package:flutter/material.dart';
import 'search_page.dart';
import '../components/welcome_banner.dart';
import '../components/vehicle_carousel.dart';
import '../components/bottom_navigation.dart';
import '../models/vehicle.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onLogout;

  const HomePage({super.key, required this.onLogout});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Row(
          children: [
            Icon(Icons.directions_car, size: 32, color: Colors.purple.shade900),
            const SizedBox(width: 12),
            Text(
              'Cool Vehicles',
              style: TextStyle(
                color: Colors.purple.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const WelcomeBanner(username: 'Andrzej'),
          SizedBox(
            height: 380,
            child: VehicleCarousel(vehicles: sampleVehicles),
          ),
          // Hidden for now
          // Padding(
          //   padding: const EdgeInsets.all(24),
          //   child: Column(
          //     children: [
          //       const Text(
          //         'You are logged in 🎉',
          //         style: TextStyle(fontSize: 24),
          //       ),
          //       const SizedBox(height: 24),
          //       ElevatedButton.icon(
          //         onPressed: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(builder: (_) => const SearchPage()),
          //           );
          //         },
          //         icon: const Icon(Icons.search),
          //         label: const Text('Go to search'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onNavigation: _navigateTo,
        onLogout: widget.onLogout,
      ),
    );
  }
}
