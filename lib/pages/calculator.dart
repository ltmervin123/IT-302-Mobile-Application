import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
    );
  }
}
