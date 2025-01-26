// model class
class Session {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  // unnamed constructor
  Session(this.id, this.date, this.description, this.duration);

  // named constructor
  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    description = sessionMap['description'] ?? '';
    duration = sessionMap['duration'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'date' : date,
      'description' : description,
      'duration' : duration
    };
  }
}