// import 'package:flutter/material.dart';
// import 'package:my_app/widgets/sidebar.dart';

// class Numbersystem extends StatelessWidget {
//   const Numbersystem({super.key});

//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(
//         title: const Text('Number System Converter'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Numbersystem extends StatelessWidget {
  const Numbersystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Number System Converter',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Binary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Decimal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Octal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Hexadecimal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
