
import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Numbersystem extends StatefulWidget {
  const Numbersystem({super.key});

  @override
  _NumbersystemState createState() => _NumbersystemState();
}

class _NumbersystemState extends State<Numbersystem> {
  final TextEditingController binaryController = TextEditingController();
  final TextEditingController decimalController = TextEditingController();
  final TextEditingController octalController = TextEditingController();
  final TextEditingController hexController = TextEditingController();

  // Function to convert binary to other systems
  void updateBinaryValues(String binary) {
    if (binary.isEmpty) {
      decimalController.clear();
      octalController.clear();
      hexController.clear();
      return;
    }

    try {
      // Convert the binary input to decimal
      int parsedBinary = int.parse(binary, radix: 2);

      // Update the Decimal, Octal, and Hexadecimal fields
      decimalController.text = parsedBinary.toString();
      octalController.text = parsedBinary.toRadixString(8);
      hexController.text = parsedBinary.toRadixString(16).toUpperCase();
    } catch (e) {
      // If the input is invalid, clear the fields
      decimalController.clear();
      octalController.clear();
      hexController.clear();
    }
  }

  void updateDecimalValues(String decimal){
    // Convert Decimal input to other systems
    if (decimal.isEmpty) {
      binaryController.clear();
      octalController.clear();
      hexController.clear();
      return;
    }
    try{
      int parsedDecimal = int.tryParse(decimal) ?? 0;
      binaryController.text = parsedDecimal.toRadixString(2);
      octalController.text = parsedDecimal.toRadixString(8);
      hexController.text = parsedDecimal.toRadixString(16).toUpperCase();

    }catch(e){
      binaryController.clear();
      octalController.clear();
      hexController.clear();
    }
  }

  void updateOctalValues(String octal){
    if(octal.isEmpty){
      decimalController.clear();
      binaryController.clear();
      hexController.clear();
      return;
    }

    try{
      int decimal = int.tryParse(octal, radix: 8) ?? 0;
      binaryController.text = decimal.toRadixString(2);
      decimalController.text = decimal.toString();
      hexController.text = decimal.toRadixString(16).toUpperCase();
    }catch(e){
      decimalController.clear();
      binaryController.clear();
      hexController.clear();
    }
}

  void updateHexadecimalValues(String hexa){
    if(hexa.isEmpty){
      decimalController.clear();
      binaryController.clear();
      octalController.clear();
      return;
    }

    try{
      int decimal = int.tryParse(hexa, radix: 16) ?? 0;
      binaryController.text = decimal.toRadixString(2);
      decimalController.text = decimal.toString();
      octalController.text = decimal.toRadixString(8);
    }catch(e){
      decimalController.clear();
      binaryController.clear();
      octalController.clear();
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Number System Converter', style: TextStyle(color: Colors.white)),
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
            TextField(
              controller: binaryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Binary',
              ),
              onChanged: (value) {
                updateBinaryValues(value); // Update other fields when Binary changes
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            const Text(
              'Decimal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: decimalController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Decimal Value',
              ),
              onChanged: (value) {
                updateDecimalValues(value);
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            const Text(
              'Octal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: octalController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Octal Value',
              ),
              onChanged: (value) {
                updateOctalValues(value);
              },
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            const Text(
              'Hexadecimal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: hexController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hexadecimal Value',
              ),
              onChanged: (value) {
                updateHexadecimalValues(value);
              },
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}

