import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _input = '';
  double? _firstOperand;
  String? _operator;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _display = '0';
        _input = '';
        _firstOperand = null;
        _operator = null;
      } else if (value == '⌫') {
        _input =
            _input.isNotEmpty ? _input.substring(0, _input.length - 1) : '';
        _display = _input.isNotEmpty ? _input : '0';
      } else if (['+', '-', '×', '÷'].contains(value)) {
        if (_firstOperand == null && _input.isNotEmpty) {
          _firstOperand = double.tryParse(_input);
          _operator = value;
          _input = '';
        } else if (_firstOperand != null && _input.isNotEmpty) {
          _firstOperand = _calculate();
          _operator = value;
          _input = '';
          _display = _firstOperand.toString();
        }
      } else if (value == '=') {
        if (_firstOperand != null && _input.isNotEmpty) {
          double? result = _calculate();
          _display = result.toString();
          _input = '';
          _firstOperand = null;
          _operator = null;
        }
      } else {
        _input += value;
        _display = _input;
      }
    });
  }

  double? _calculate() {
    double secondOperand = double.tryParse(_input) ?? 0;
    if (_operator == '+') return _firstOperand! + secondOperand;
    if (_operator == '-') return _firstOperand! - secondOperand;
    if (_operator == '×') return _firstOperand! * secondOperand;
    if (_operator == '÷') return _firstOperand! / secondOperand;
    return null;
  }

  Widget _buildButton(String label, Color color, Color textColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      onPressed: () => _onButtonPressed(label),
      child: Text(label, style: TextStyle(fontSize: 24, color: textColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                _display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('C', Colors.red, Colors.white),
                    _buildButton('⌫', Colors.orange, Colors.white),
                    _buildButton('÷', Colors.blue, Colors.white),
                    _buildButton('×', Colors.blue, Colors.white),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('7', Colors.white, Colors.black),
                    _buildButton('8', Colors.white, Colors.black),
                    _buildButton('9', Colors.white, Colors.black),
                    _buildButton('-', Colors.blue, Colors.white),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('4', Colors.white, Colors.black),
                    _buildButton('5', Colors.white, Colors.black),
                    _buildButton('6', Colors.white, Colors.black),
                    _buildButton('+', Colors.blue, Colors.white),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('1', Colors.white, Colors.black),
                    _buildButton('2', Colors.white, Colors.black),
                    _buildButton('3', Colors.white, Colors.black),
                    _buildButton('=', Colors.green, Colors.white),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('0', Colors.white, Colors.black),
                    _buildButton('.', Colors.white, Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
