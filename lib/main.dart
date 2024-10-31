import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _input = "";
  String _operation = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _input = "";
        _operation = "";
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        _num1 = double.parse(_input);
        _operation = buttonText;
        _input = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_input);
        if (_operation == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operation == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operation == "×") {
          _output = (_num1 * _num2).toString();
        } else if (_operation == "÷") {
          _output = (_num1 / _num2).toString();
        }
        _input = _output;
        _operation = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: color,
            shape: const CircleBorder(),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48.0, color: Colors.white),
            ),
          ),
          const Divider(color: Colors.white),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("C", Colors.grey),
                  _buildButton("+/-", Colors.grey),
                  _buildButton("%", Colors.grey),
                  _buildButton("÷", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("7", Colors.grey.shade800),
                  _buildButton("8", Colors.grey.shade800),
                  _buildButton("9", Colors.grey.shade800),
                  _buildButton("×", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("4", Colors.grey.shade800),
                  _buildButton("5", Colors.grey.shade800),
                  _buildButton("6", Colors.grey.shade800),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("1", Colors.grey.shade800),
                  _buildButton("2", Colors.grey.shade800),
                  _buildButton("3", Colors.grey.shade800),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor: Colors.grey.shade800,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => _buttonPressed("0"),
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  _buildButton(".", Colors.grey.shade800),
                  _buildButton("=", Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
