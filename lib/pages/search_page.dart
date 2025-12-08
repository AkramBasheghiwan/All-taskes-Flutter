import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'ابحث هنا...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'عمليات البحث الأخيرة',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: [
              ActionChip(label: const Text('ملابس'), onPressed: () {}),
              ActionChip(label: const Text('الكترونيات'), onPressed: () {}),
              ActionChip(label: const Text('كتب'), onPressed: () {}),
              ActionChip(label: const Text('أحذية رياضية'), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
