class Vehicle {
  final String id;
  final String title;
  final String yearMake;
  final String description;
  final String imageUrl;

  Vehicle({
    required this.id,
    required this.title,
    required this.yearMake,
    required this.description,
    required this.imageUrl,
  });
}

// Sample data
final List<Vehicle> sampleVehicles = [
  Vehicle(
    id: '1',
    title: 'Tesla Model 3',
    yearMake: '2023 Tesla',
    description: 'Electric sedan with advanced autopilot features',
    imageUrl:
        'https://images.unsplash.com/photo-1560958089-b8a63dd8b50b?w=400&h=300&fit=crop',
  ),
  Vehicle(
    id: '2',
    title: 'BMW X5',
    yearMake: '2022 BMW',
    description: 'Premium SUV with luxury interior and performance',
    imageUrl:
        'https://images.unsplash.com/photo-1552820728-8ac41f1ce891?w=400&h=300&fit=crop',
  ),
  Vehicle(
    id: '3',
    title: 'Mercedes-Benz C-Class',
    yearMake: '2023 Mercedes',
    description: 'Elegant sedan with cutting-edge technology',
    imageUrl:
        'https://images.unsplash.com/photo-1494976866556-6812c9d1c72e?w=400&h=300&fit=crop',
  ),
];
