import 'package:flutter/material.dart';
import '../models/document.dart';

class DocumentCard extends StatelessWidget {
  final Document document;
  final VoidCallback onDownload;
  final VoidCallback onView;

  const DocumentCard({
    super.key,
    required this.document,
    required this.onDownload,
    required this.onView,
  });

  IconData _getDocumentIcon(String iconName) {
    switch (iconName) {
      case 'manual':
        return Icons.auto_stories;
      case 'safety':
        return Icons.warning_amber;
      case 'schedule':
        return Icons.calendar_month;
      case 'diagram':
        return Icons.schema;
      case 'guide':
        return Icons.help_outline;
      case 'warranty':
        return Icons.verified;
      default:
        return Icons.description;
    }
  }

  Color _getLabelColor(DocumentLabel label) {
    switch (label) {
      case DocumentLabel.critical:
        return Colors.red.shade600;
      case DocumentLabel.guide:
        return Colors.blue.shade600;
      case DocumentLabel.schedule:
        return Colors.orange.shade600;
      case DocumentLabel.diagram:
        return Colors.green.shade600;
    }
  }

  String _getLabelText(DocumentLabel label) {
    return label.toString().split('.').last.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getDocumentIcon(document.iconName),
                size: 28,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    document.subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getLabelColor(document.label),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getLabelText(document.label),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${document.format} • ${document.size}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Action Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onDownload,
                  icon: const Icon(Icons.download),
                  color: Colors.blue.shade600,
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
                IconButton(
                  onPressed: onView,
                  icon: const Icon(Icons.visibility),
                  color: Colors.purple.shade600,
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
