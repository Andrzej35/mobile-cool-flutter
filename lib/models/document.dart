class Document {
  final String id;
  final String title;
  final String subtitle;
  final String format;
  final String size;
  final DocumentLabel label;
  final String iconName;

  Document({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.format,
    required this.size,
    required this.label,
    required this.iconName,
  });
}

enum DocumentLabel { critical, guide, schedule, diagram }

// Sample data
final List<Document> sampleDocuments = [
  Document(
    id: '1',
    title: 'Service Manual',
    subtitle: 'Tesla Model 3 2023',
    format: 'PDF',
    size: '12.5 MB',
    label: DocumentLabel.guide,
    iconName: 'manual',
  ),
  Document(
    id: '2',
    title: 'Emergency Shutdown',
    subtitle: 'Critical Safety Procedure',
    format: 'PDF',
    size: '2.3 MB',
    label: DocumentLabel.critical,
    iconName: 'safety',
  ),
  Document(
    id: '3',
    title: 'Maintenance Schedule',
    subtitle: '2023-2024 Service Plan',
    format: 'PDF',
    size: '1.8 MB',
    label: DocumentLabel.schedule,
    iconName: 'schedule',
  ),
  Document(
    id: '4',
    title: 'Electrical System',
    subtitle: 'Complete Wiring Diagram',
    format: 'PDF',
    size: '5.6 MB',
    label: DocumentLabel.diagram,
    iconName: 'diagram',
  ),
  Document(
    id: '5',
    title: 'Owner\'s Guide',
    subtitle: 'Features and Controls',
    format: 'PDF',
    size: '8.2 MB',
    label: DocumentLabel.guide,
    iconName: 'guide',
  ),
  Document(
    id: '6',
    title: 'Warranty Information',
    subtitle: 'Coverage and Terms',
    format: 'PDF',
    size: '0.9 MB',
    label: DocumentLabel.critical,
    iconName: 'warranty',
  ),
];
