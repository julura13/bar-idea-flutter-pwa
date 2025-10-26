import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iot_weight_pwa/core/constants.dart';

class ApiClient {
  static const _storage = FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';
  
  static Future<String?> _getToken() async {
    return await _storage.read(key: _tokenKey);
  }
  
  static Future<void> _saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }
  
  static Future<void> _deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
  
  static Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    
    return headers;
  }
  
  static Future<http.Response> _handleResponse(http.Response response) async {
    if (response.statusCode == 401) {
      await _deleteToken();
      throw UnauthorizedException();
    }
    return response;
  }
  
  // Authentication
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.login}'),
      headers: await _getHeaders(),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      await _saveToken(data['token']);
      return data;
    } else {
      throw Exception('Login failed: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> register(String name, String email, String password, String? phone) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.register}'),
      headers: await _getHeaders(),
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        if (phone != null) 'phone': phone,
      }),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 201) {
      final data = jsonDecode(responseData.body);
      await _saveToken(data['token']);
      return data;
    } else {
      throw Exception('Registration failed: ${responseData.body}');
    }
  }
  
  static Future<void> logout() async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.logout}'),
      headers: await _getHeaders(),
    );
    
    await _handleResponse(response);
    await _deleteToken();
  }
  
  static Future<Map<String, dynamic>> getMe() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.me}'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get user info: ${responseData.body}');
    }
  }
  
  // Controllers
  static Future<List<dynamic>> getControllers() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.controllers}'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get controllers: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> createController(String macAddress, String name) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.controllers}'),
      headers: await _getHeaders(),
      body: jsonEncode({
        'mac_address': macAddress,
        'name': name,
      }),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 201) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to create controller: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> getController(String id) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.controllers}/$id'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get controller: ${responseData.body}');
    }
  }
  
  // Modules
  static Future<List<dynamic>> getModules(String controllerId) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.controllers}/$controllerId/modules'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get modules: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> createModule(String controllerId, Map<String, dynamic> moduleData) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.controllers}/$controllerId/modules'),
      headers: await _getHeaders(),
      body: jsonEncode(moduleData),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 201) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to create module: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> getModule(String id) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.modules}/$id'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get module: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> updateModule(String id, Map<String, dynamic> moduleData) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.modules}/$id'),
      headers: await _getHeaders(),
      body: jsonEncode(moduleData),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to update module: ${responseData.body}');
    }
  }
  
  // Commands
  static Future<Map<String, dynamic>> sendCommand(String moduleId, String commandType, String commandPayload) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.modules}/$moduleId/command'),
      headers: await _getHeaders(),
      body: jsonEncode({
        'command_type': commandType,
        'command_payload': commandPayload,
      }),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 202) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to send command: ${responseData.body}');
    }
  }
  
  // Readings
  static Future<List<dynamic>> getReadings(String moduleId, {String? from, String? to, int? limit}) async {
    final queryParams = <String, String>{};
    if (from != null) queryParams['from'] = from;
    if (to != null) queryParams['to'] = to;
    if (limit != null) queryParams['limit'] = limit.toString();
    
    final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.modules}/$moduleId/readings').replace(
      queryParameters: queryParams,
    );
    
    final response = await http.get(
      uri,
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get readings: ${responseData.body}');
    }
  }
  
  static Future<Map<String, dynamic>> getModuleStats(String moduleId) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.modules}/$moduleId/stats'),
      headers: await _getHeaders(),
    );
    
    final responseData = await _handleResponse(response);
    
    if (responseData.statusCode == 200) {
      return jsonDecode(responseData.body);
    } else {
      throw Exception('Failed to get module stats: ${responseData.body}');
    }
  }
}

class UnauthorizedException implements Exception {
  @override
  String toString() => 'Unauthorized: Please login again';
}
