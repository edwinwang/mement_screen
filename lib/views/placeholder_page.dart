import 'package:flutter/material.dart';

class PlaceholderPage extends StatelessWidget {
  final String pageName;

  const PlaceholderPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the $pageName page'),
    );
  }
}
