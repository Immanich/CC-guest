import 'dart:convert';

class Service {
  final int id;
  final String service_name;
  final String description;
  final int officeId;
  final String? transactionId;
  final String classification;
  final List<String> checklistOfRequirements;
  final String whereToSecure;

  Service({
    required this.id,
    required this.service_name,
    required this.description,
    required this.officeId,
    this.transactionId,
    required this.classification,
    required this.checklistOfRequirements,
    required this.whereToSecure,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      service_name: json['service_name'].toString(),
      description: json['description']?.toString() ?? '',
      officeId: json['office_id'],
      transactionId: json['transaction_id']?.toString(),
      classification: json['classification'].toString(),
      checklistOfRequirements: json['checklist_of_requirements'] != null
          ? (jsonDecode(json['checklist_of_requirements']) as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : [],
      // checklistOfRequirements: json['checklist_of_requirements'] != null
      // ? List<String>.from(json[
      //     'checklist_of_requirements']) // Convert JSON array to List<String>
      // : [], // Default to an empty list if null
      whereToSecure: json['where_to_secure'].toString(),
    );
  }
}
