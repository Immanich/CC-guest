import 'package:flutter/material.dart';
import 'package:citizen_charter/models/event.dart';
import 'package:citizen_charter/models/services_info.dart';
import 'package:citizen_charter/screens/events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import '../models/service.dart';

class ApiService {
  final String baseUrl =
      'http://192.168.1.2:8000/api'; //for physical device emulator
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

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);

        // Ensure you map both services and their associated servicesInfo
        if (decodedJson is List) {
          return decodedJson.map((json) => Service.fromJson(json)).toList();
        } else {
          throw Exception(
              'Expected a list of services but got something else.');
        }
      } else {
        throw Exception('Failed to load services for office from server.');
      }
    } catch (error) {
      throw Exception('Failed to load services for office: $error');
    }
  }

  Future<List<Service>> fetchServicesForOfficeFeedback(int officeId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/offices/$officeId/services'));

    if (response.statusCode == 200) {
      // Convert the JSON response into a list of Service objects
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Service.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load services for office');
    }
  }

  Future<List<dynamic>> fetchEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/events'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchNotifications() async {
    final response = await http.get(Uri.parse('$baseUrl/notifications'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notifications: ${response.statusCode}');
    }
  }

  Future<dynamic> fetchEventById(int eventId) async {
    final response = await http.get(Uri.parse('$baseUrl/events/$eventId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load event: ${response.statusCode}');
    }
  }
}
