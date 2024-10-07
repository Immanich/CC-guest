import 'dart:convert';

class ServicesInfo {
  final int id;
  final int serviceId;
  final int step;
  final String? infoTitle;
  final List<dynamic>
      clients; // Since it's a JSON array, we represent it as a list.
  final List<dynamic> agencyAction; // Same here for JSON array.
  final List<dynamic> fees;
  final List<dynamic>
      processingTime; // Represent as a list due to JSON structure.
  final List<dynamic> personResponsible; // Same here.
  final double totalFees;
  final String totalResponseTime;

  ServicesInfo({
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
  });

  factory ServicesInfo.fromJson(Map<String, dynamic> json) {
    return ServicesInfo(
      id: json['id'],
      serviceId: json['service_id'],
      step: json['step'],
      infoTitle: json['info_title']?.toString(),
      clients: jsonDecode(json['clients']), // Decode JSON array into a list.
      agencyAction:
          jsonDecode(json['agency_action']), // Decode JSON array into a list.
      fees: jsonDecode(json['fees'].toDouble()),
      processingTime:
          jsonDecode(json['processing_time']), // Decode JSON array into a list.
      personResponsible: jsonDecode(
          json['person_responsible']), // Decode JSON array into a list.
      totalFees: json['total_fees'].toDouble(),
      totalResponseTime: json['total_response_time'].toString(),
    );
  }
}
