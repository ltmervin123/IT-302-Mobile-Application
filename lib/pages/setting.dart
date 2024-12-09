import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
    );
  }
}
