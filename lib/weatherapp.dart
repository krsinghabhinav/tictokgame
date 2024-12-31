import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String _apiKey = 'YOUR_API_KEY_HERE';
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;

  Future<void> _fetchWeather(String city) async {
    if (city.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _weatherData = jsonDecode(response.body);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('City not found! Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather data.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _fetchWeather(_cityController.text),
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _weatherData != null
                    ? WeatherInfo(data: _weatherData!)
                    : Text('Enter a city to get weather details.'),
          ],
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic> data;

  WeatherInfo({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City: ${data['name']}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Temperature: ${data['main']['temp']}°C',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          'Weather: ${data['weather'][0]['description']}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          'Humidity: ${data['main']['humidity']}%',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          'Wind Speed: ${data['wind']['speed']} m/s',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
