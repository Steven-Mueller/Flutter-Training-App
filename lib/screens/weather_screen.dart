import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/http_helper.dart';
import 'package:flutter_application_1/data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtLan = TextEditingController();
  final TextEditingController txtLon = TextEditingController();
  Weather result = Weather('', '', 0.0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: txtLan,
                    decoration: InputDecoration(
                      hintText: 'Enter lan',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: txtLon,
                    decoration: InputDecoration(
                      hintText: 'Enter lon',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: getData,
                    child: Text('Get Data', style: TextStyle(fontSize: 18))),
                weatherRow('Place', result.name),
                weatherRow('Description', result.description),
                weatherRow(
                    'Temperature', result.temperature.toStringAsFixed(1)),
                weatherRow('Humidity', result.humidity.toString())
              ],
            )));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtLan.text, txtLon.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Text(label,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).hintColor))),
        Expanded(
            flex: 4,
            child: Text(value,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor))),
      ]),
    );
    return row;
  }
}
