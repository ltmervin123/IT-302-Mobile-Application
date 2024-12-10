// import 'package:flutter/material.dart';
// import 'package:my_app/widgets/sidebar.dart';

// class Calculator extends StatelessWidget {
//   const Calculator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(
//         title: const Text('Calculator'),
//       ),
//       body: Column(
//         children: [
//           // Display
//           Expanded(
//             flex: 2,
//             child: Container(
//               color: Colors.black,
//               alignment: Alignment.bottomRight,
//               padding: const EdgeInsets.all(20),
//               child: const Text(
//                 '1,984',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           // Buttons
//           Expanded(
//             flex: 3,
//             child: Container(
//               color: Colors.black,
//               child: Column(
//                 children: [
//                   // Button rows
//                   _buildButtonRow(
//                     ['C', '+/-', '%', '÷'],
//                     [Colors.grey!, Colors.grey, Colors.grey, Colors.orange],
//                   ),
//                   _buildButtonRow(
//                     ['7', '8', '9', '×'],
//                     [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
//                   ),
//                   _buildButtonRow(
//                     ['4', '5', '6', '-'],
//                     [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
//                   ),
//                   _buildButtonRow(
//                     ['1', '2', '3', '+'],
//                     [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
//                   ),
//                   _buildButtonRow(
//                     ['0', '.', '='],
//                     [Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
//                     isLastRow: true,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// Widget _buildButton(String label, Color color, {double flex = 1}) {
//   return Expanded(
//     flex: flex.toInt(),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(40), // Rounded rectangular shape
//         ),
//         child: Center(
//           child: Text(
//             label,
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildButtonRow(List<String> labels, List<Color> colors, {bool isLastRow = false}) {
//   return Expanded(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(labels.length, (index) {
//         if (isLastRow && index == 0) {
//           // The 0 button spans two columns
//           return _buildButton(labels[index], colors[index], flex: 2);
//         } else {
//           return _buildButton(labels[index], colors[index]);
//         }
//       }),
//     ),
//   );
// }

// }

import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '0'; // Display string
  String userInput = ''; // User input string
  String lastOperator = ''; // Store the last operator used
  double? firstOperand; // First operand for calculation

  // Function to handle button presses
  void onButtonPress(String label) {
    setState(() {
      if (label == 'C') {
        display = '0'; // Reset display
        userInput = '';
        firstOperand = null;
        lastOperator = '';
      } else if (label == '+/-') {
        // Toggle the sign of the current number
        if (display.startsWith('-')) {
          display = display.substring(1);
        } else {
          display = '-' + display;
        }
      } else if (label == '=') {
        // Perform the calculation
        if (firstOperand != null && lastOperator.isNotEmpty) {
          double secondOperand = double.parse(display);
          switch (lastOperator) {
            case '+':
              display = (firstOperand! + secondOperand).toString();
              break;
            case '-':
              display = (firstOperand! - secondOperand).toString();
              break;
            case '×':
              display = (firstOperand! * secondOperand).toString();
              break;
            case '÷':
              if (secondOperand != 0) {
                display = (firstOperand! / secondOperand).toString();
              } else {
                display = 'Error'; // Division by zero
              }
              break;
            default:
              break;
          }
          userInput = display; // Update input string
          firstOperand = null;
          lastOperator = '';
        }
      } else if (label == '%') {
        // Percentage functionality
        display = (double.parse(display) / 100).toString();
      } else if (['+', '-', '×', '÷'].contains(label)) {
        // Store the first operand and operator
        firstOperand = double.parse(display);
        lastOperator = label;
        display = '0'; // Clear display for next input
      } else {
        // Handle number and dot
        if (display == '0' && label != '.') {
          display = label; // If '0', replace with the pressed number
        } else {
          display += label; // Otherwise, append to the current number
        }
      }
    });
  }

  Widget _buildButton(String label, Color color, {double flex = 1}) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40), // Rounded rectangular shape
          ),
          child: InkWell(
            onTap: () => onButtonPress(label), // Handle button press
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> labels, List<Color> colors, {bool isLastRow = false}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          if (isLastRow && index == 0) {
            // The 0 button spans two columns
            return _buildButton(labels[index], colors[index], flex: 2);
          } else {
            return _buildButton(labels[index], colors[index]);
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  // Button rows
                  _buildButtonRow(
                    ['C', '+/-', '%', '÷'],
                    [Colors.grey!, Colors.grey, Colors.grey, Colors.orange],
                  ),
                  _buildButtonRow(
                    ['7', '8', '9', '×'],
                    [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
                  ),
                  _buildButtonRow(
                    ['4', '5', '6', '-'],
                    [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
                  ),
                  _buildButtonRow(
                    ['1', '2', '3', '+'],
                    [Colors.grey[850]!, Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
                  ),
                  _buildButtonRow(
                    ['0', '.', '='],
                    [Colors.grey[850]!, Colors.grey[850]!, Colors.orange],
                    isLastRow: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

