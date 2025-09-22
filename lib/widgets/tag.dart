import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 8, spacing: 8, children: items.map((e) => Tag(label: e)).toList());
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xff7dc3ff)),
      ),
      child: Text(label),
    );
  }
}
