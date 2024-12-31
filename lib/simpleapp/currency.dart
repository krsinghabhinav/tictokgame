import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  final List<String> _currencies = ['USD', 'EUR', 'INR', 'GBP', 'JPY'];
  String _fromCurrency = 'USD';
  String _toCurrency = 'INR';
  double _conversionRate = 0.0;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _fetchConversionRate();
  }

  Future<void> _fetchConversionRate() async {
    final apiKey = 'your_api_key_here'; // Replace with your API key
    final url =
        'https://api.exchangerate-api.com/v4/latest/$_fromCurrency'; // Example API
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _conversionRate = data['rates'][_toCurrency];
        });
      } else {
        throw Exception('Failed to load conversion rate');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching conversion rate: $e')),
      );
    }
  }

  void _convertCurrency() {
    if (_amountController.text.isNotEmpty) {
      final amount = double.tryParse(_amountController.text);
      if (amount != null) {
        final convertedAmount = amount * _conversionRate;
        setState(() {
          _result =
              '$amount $_fromCurrency = ${convertedAmount.toStringAsFixed(2)} $_toCurrency';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid input amount')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: _fromCurrency,
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _fromCurrency = newValue!;
                      _fetchConversionRate();
                    });
                  },
                ),
                Icon(Icons.swap_horiz),
                DropdownButton<String>(
                  value: _toCurrency,
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _toCurrency = newValue!;
                      _fetchConversionRate();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
