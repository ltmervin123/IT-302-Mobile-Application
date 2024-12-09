import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
    );
  }
}
