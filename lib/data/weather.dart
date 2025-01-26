class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    name = weatherMap['name'];
    description = weatherMap['weather'][0]['description'];
    temperature = weatherMap['main']['temp'] - 273.15 ?? 0;
    humidity = weatherMap['main']['humidity'] ?? 0;
  }
}
