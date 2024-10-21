import 'dart:convert';
import 'package:citizen_charter/models/services_info.dart';

class Service {
  final int id;
  final String service_name;
  final String description;
  final int officeId;
  final String typeOfTransaction;
  final String classification;
  final List<String> checklistOfRequirements;
  final List<String> whereToSecure;
  final List<ServiceInfo> servicesInfos;

  Service({
    required this.id,
    required this.service_name,
    required this.description,
    required this.officeId,
    required this.typeOfTransaction,
    required this.classification,
    required this.checklistOfRequirements,
    required this.whereToSecure,
    required this.servicesInfos,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      service_name: json['service_name'].toString(),
      description: json['description']?.toString() ?? '',
      officeId: json['office_id'],
      typeOfTransaction: json['type_of_transaction'].toString(),
      classification: json['classification'].toString(),
      checklistOfRequirements:
          _parseChecklistOfRequirements(json['checklist_of_requirements']),
      whereToSecure: _parseChecklistOfRequirements(json['where_to_secure']),
      servicesInfos:
          (json['services_infos'] != null && json['services_infos'] is List)
              ? (json['services_infos'] as List<dynamic>)
                  .map((info) => ServiceInfo.fromJson(info))
                  .toList()
              : [],
    );
  }

  // Helper method to handle checklist_of_requirements
  static List<String> _parseChecklistOfRequirements(dynamic checklist) {
    if (checklist is String) {
      try {
        // Try to decode the string assuming it's JSON
        var decoded = jsonDecode(checklist);
        if (decoded is List) {
          return decoded.map((e) => e.toString()).toList();
        }
      } catch (e) {
        // If it's a simple string, return it as a single-element list
        return [checklist];
      }
    } else if (checklist is List) {
      // If it's already a list, return it as List<String>
      return checklist.map((e) => e.toString()).toList();
    }
    return []; // Return an empty list if it's null or invalid
  }
}
