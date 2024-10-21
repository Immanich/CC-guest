enum EventStatus { pending, approved, rejected }

class Event {
  final String image;
  final String title;
  final String description;
  final EventStatus status;

  Event({
    required this.image,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      // image: 'http://192.168.1.10:8000/${json['image']}',
      image: 'http://10.0.2.2:8000/${json['image']}',
      title: json['title'].toString(),
      description: json['description'].toString(),
      status: EventStatus.values
          .firstWhere((element) => element.name == json['status']),
    );
  }
}
