import 'dart:convert';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:iot_weight_pwa/core/constants.dart';
import 'package:iot_weight_pwa/providers/auth_provider.dart';

class WebSocketNotifier extends StateNotifier<AsyncValue<WebSocketChannel?>> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  
  WebSocketNotifier() : super(const AsyncValue.data(null));

  void connect(String token) {
    try {
      _channel?.sink.close();
      
      final uri = Uri.parse('${ApiConstants.websocketUrl}?token=$token');
      _channel = WebSocketChannel.connect(uri);
      
      state = AsyncValue.data(_channel);
      
      _subscription = _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnect,
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close();
    _channel = null;
    state = const AsyncValue.data(null);
  }

  void _handleMessage(dynamic message) {
    try {
      final data = jsonDecode(message);
      // Handle different message types
      switch (data['type']) {
        case 'controller_status_changed':
          _handleControllerStatusChanged(data);
          break;
        case 'weight_reading_received':
          _handleWeightReadingReceived(data);
          break;
        case 'command_response_received':
          _handleCommandResponseReceived(data);
          break;
        case 'module_config_updated':
          _handleModuleConfigUpdated(data);
          break;
      }
    } catch (e) {
      // Handle JSON parsing errors
    }
  }

  void _handleError(error) {
    state = AsyncValue.error(error, StackTrace.current);
  }

  void _handleDisconnect() {
    state = const AsyncValue.data(null);
  }

  void _handleControllerStatusChanged(Map<String, dynamic> data) {
    // Update controller status in the app
    // This would trigger a refresh of the controllers list
  }

  void _handleWeightReadingReceived(Map<String, dynamic> data) {
    // Update weight reading in the app
    // This would trigger a refresh of the module data
  }

  void _handleCommandResponseReceived(Map<String, dynamic> data) {
    // Update command status in the app
    // This would show success/error messages
  }

  void _handleModuleConfigUpdated(Map<String, dynamic> data) {
    // Update module configuration in the app
    // This would trigger a refresh of the module data
  }

  void sendMessage(Map<String, dynamic> message) {
    if (_channel != null) {
      _channel!.sink.add(jsonEncode(message));
    }
  }
}

final websocketProvider = StateNotifierProvider<WebSocketNotifier, AsyncValue<WebSocketChannel?>>((ref) {
  return WebSocketNotifier();
});

// Provider to automatically connect/disconnect based on auth state
final websocketConnectionProvider = Provider<void>((ref) {
  final authState = ref.watch(authProvider);
  final websocket = ref.read(websocketProvider.notifier);
  
  if (authState.isAuthenticated) {
    // Connect to WebSocket when authenticated
    // Note: In a real implementation, you'd need to get the token from storage
    // websocket.connect(token);
  } else {
    // Disconnect when not authenticated
    websocket.disconnect();
  }
});
