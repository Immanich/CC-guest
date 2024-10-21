class NotificationModel {
  final int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final int eventId;
  // final int userId;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.eventId,
    // required this.userId
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    print('JSON data: $json');
    return NotificationModel(
      id: json['id'],
      title: json['title'].toString(),
      description: json['description'].toString(),
      dateTime: DateTime.parse(json['dateTime']),
      eventId: json['eventId'] ?? 0,
      // userId: json['userId'] ?? 1,
    );
  }
}
