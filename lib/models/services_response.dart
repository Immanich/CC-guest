import 'dart:developer';

import 'package:citizen_charter/models/services_info.dart';

class ServicesResponse {
  final List<Service> services;
  final ServicesInfo servicesInfo;

  ServicesResponse({required this.services, required this.servicesInfo});
}
