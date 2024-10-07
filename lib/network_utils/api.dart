import 'package:citizen_charter/models/services_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '../models/service.dart';

class ApiService {
  final String baseUrl =
      'http://192.168.1.9:8000/api'; //for physical device emulator
  // final String baseUrl = 'http://10.0.2.2:8000/api'; // for android emulator

  Future<List<dynamic>> fetchOfficesFromServer() async {
    final response = await http.get(Uri.parse('$baseUrl/offices'));

    if (response.statusCode == 200) {
      log('Offices fetched: ${response.body}');
      return json.decode(response.body); // Return decoded JSON
    } else {
      log('Failed to fetch offices: ${response.statusCode}');
      throw Exception('Failed to load offices from server');
    }
  }

  Future<List<Service>> fetchServicesForOffice(int officeId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/offices/$officeId/services'));

      log('Request URL: ${Uri.parse('$baseUrl/offices/$officeId/services')}');
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        log('Decoded JSON type: ${decodedJson.runtimeType}');

        // Check if the response is a list
        if (decodedJson is List) {
          return decodedJson.map((json) => Service.fromJson(json)).toList();
        } else {
          log('Unexpected response format: expected a list, but got something else.');
          throw Exception(
              'Expected a list of services but got something else.');
        }
      } else {
        throw Exception(
            'Failed to load services for office from server: ${response.statusCode}');
      }
    } catch (error) {
      log('Error occurred: $error');
      throw Exception('Failed to load services for office: $error');
    }
  }

  Future<ServicesInfo> fetchServiceInfo(int serviceId) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/services/$serviceId/info'));

      log('Request URL: ${Uri.parse('$baseUrl/services/$serviceId/info')}');
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        log('Decoded JSON type: ${decodedJson.runtimeType}');

        // Check if the response is a JSON object
        if (decodedJson is Map<String, dynamic>) {
          return ServicesInfo.fromJson(decodedJson);
        } else {
          log('Unexpected response format: expected a JSON object, but got something else.');
          throw Exception('Expected service info but got something else.');
        }
      } else {
        throw Exception(
            'Failed to load service info from server: ${response.statusCode}');
      }
    } catch (error) {
      log('Error occurred: $error');
      throw Exception('Failed to load service info: $error');
    }
  }

  // Future<ServicesInfo> fetchServicesInfoForService(int serviceId) async {
  //   // API call to get ServicesInfo based on serviceId
  //   // Example: return ServicesInfo.fromJson(responseData);
  // }

  // Future<List<Service>> fetchServicesForOffice(int officeId) async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('$baseUrl/offices/$officeId/services'));

  //     log('Request URL: ${Uri.parse('$baseUrl/offices/$officeId/services')}');
  //     log('Response status: ${response.statusCode}');
  //     log('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       List<dynamic> servicesJson = json.decode(response.body);

  //       // Convert the JSON list into a list of Service objects
  //       return servicesJson.map((json) => Service.fromJson(json)).toList();
  //     } else {
  //       throw Exception(
  //           'Failed to load services for office from server: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     log('Error occurred: $error');
  //     throw Exception('Failed to load services for office: $error');
  //   }
  // }
}
