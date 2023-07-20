import 'package:flutter/material.dart';

class ManualMarkView extends StatefulWidget {
  const ManualMarkView({super.key});

  @override
  State<ManualMarkView> createState() => _ManualMarkViewState();
}

class _ManualMarkViewState extends State<ManualMarkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Marking'),
        elevation: 4,
      ),
      body: const Placeholder(),
    );
  }
}
