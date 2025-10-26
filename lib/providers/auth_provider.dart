import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iot_weight_pwa/core/api_client.dart';
import 'package:iot_weight_pwa/models/client.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    Client? client,
    @Default(false) bool isLoading,
    String? error,
  }) = _AuthState;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      state = state.copyWith(isLoading: true);
      final clientData = await ApiClient.getMe();
      final client = Client.fromJson(clientData);
      
      state = state.copyWith(
        isAuthenticated: true,
        client: client,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        client: null,
        isLoading: false,
        error: null,
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final response = await ApiClient.login(email, password);
      final client = Client.fromJson(response['client']);
      
      state = state.copyWith(
        isAuthenticated: true,
        client: client,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        client: null,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> register(String name, String email, String password, String? phone) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      final response = await ApiClient.register(name, email, password, phone);
      final client = Client.fromJson(response['client']);
      
      state = state.copyWith(
        isAuthenticated: true,
        client: client,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        client: null,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    try {
      await ApiClient.logout();
      state = const AuthState();
    } catch (e) {
      // Even if logout fails on server, clear local state
      state = const AuthState();
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
