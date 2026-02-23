import 'package:flutter/material.dart';
import '../models/document.dart';
import '../components/document_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  String _query = '';
  String _selectedFilter = 'All';

  final List<String> _filterOptions = [
    'All',
    'Critical',
    'Guide',
    'Schedule',
    'Diagram',
  ];

  List<Document> _getFilteredDocuments() {
    var filtered = sampleDocuments.where((doc) {
      final matchesQuery =
          doc.title.toLowerCase().contains(_query.toLowerCase()) ||
          doc.subtitle.toLowerCase().contains(_query.toLowerCase());

      final matchesFilter =
          _selectedFilter == 'All' ||
          doc.label.toString().split('.').last.toUpperCase() ==
              _selectedFilter.toUpperCase();

      return matchesQuery && matchesFilter;
    }).toList();

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _getFilteredDocuments();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Search Documents',
          style: TextStyle(
            color: Colors.purple.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.purple.shade900),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search documents',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() {
                            _query = '';
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filterOptions.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      backgroundColor: Colors.grey.shade200,
                      selectedColor: Colors.purple.shade600,
                      labelStyle: TextStyle(
                        color: _selectedFilter == filter
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Results
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No documents found',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return DocumentCard(
                          document: filtered[index],
                          onDownload: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Downloading ${filtered[index].title}...',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          onView: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Viewing ${filtered[index].title}...',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
            // Results counter
            if (filtered.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${filtered.length} document${filtered.length != 1 ? 's' : ''} found',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
