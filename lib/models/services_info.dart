import 'dart:convert';

class ServiceInfo {
  int id;
  int serviceId;
  int step;
  String infoTitle;
  List<String> clients;
  List<String> agencyAction;
  List<String> fees;
  List<String> processingTime;
  List<String> personResponsible;
  String totalFees;
  String totalResponseTime;
  String note;

  ServiceInfo({
    required this.id,
    required this.serviceId,
    required this.step,
    required this.infoTitle,
    required this.clients,
    required this.agencyAction,
    required this.fees,
    required this.processingTime,
    required this.personResponsible,
    required this.totalFees,
    required this.totalResponseTime,
    required this.note,
  });

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      id: json['id'],
      serviceId: json['service_id'],
      step: json['step'],
      infoTitle: json['info_title'] ?? '',
      clients: _parseStringList(json['clients']),
      agencyAction: _parseStringList(json['agency_action']),
      fees: _parseStringList(json['fees']),
      processingTime: _parseStringList(json['processing_time']),
      personResponsible: _parseStringList(json['person_responsible']),
      totalFees: json['total_fees'] ?? '',
      totalResponseTime: json['total_response_time'] ?? '',
      note: json['note'] ?? '',
    );
  }

  // Helper method to handle all List<String> parsing safely
  static List<String> _parseStringList(dynamic value) {
    if (value is String) {
      try {
        // Try to decode the string assuming it's JSON
        var decoded = jsonDecode(value);
        if (decoded is List) {
          return decoded.map((e) => e.toString()).toList();
        }
      } catch (e) {
        // If it's a simple string, return it as a single-element list
        return [value];
      }
    } else if (value is List) {
      // If it's already a list, return it as List<String>
      return value.map((e) => e.toString()).toList();
    }
    return []; // Return an empty list if null or invalid
  }
}
