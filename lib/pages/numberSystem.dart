import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Numbersystem extends StatelessWidget {
  const Numbersystem({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Number System Converter'),
      ),
    );
  }
}