class Office {
  final int id;
  final String office_name;
  final String description;

  Office({
    required this.id,
    required this.office_name,
    required this.description,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'],
      office_name: json['office_name'].toString(),
      description: json['description']?.toString() ?? '',
    );
  }
}
