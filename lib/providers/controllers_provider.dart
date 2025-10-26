import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_weight_pwa/core/api_client.dart';
import 'package:iot_weight_pwa/models/controller.dart';

class ControllersNotifier extends StateNotifier<AsyncValue<List<Controller>>> {
  ControllersNotifier() : super(const AsyncValue.loading()) {
    loadControllers();
  }

  Future<void> loadControllers() async {
    try {
      state = const AsyncValue.loading();
      final controllersData = await ApiClient.getControllers();
      final controllers = controllersData
          .map((data) => Controller.fromJson(data))
          .toList();
      state = AsyncValue.data(controllers);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createController(String macAddress, String name) async {
    try {
      final controllerData = await ApiClient.createController(macAddress, name);
      final newController = Controller.fromJson(controllerData);
      
      state.whenData((controllers) {
        state = AsyncValue.data([...controllers, newController]);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateController(int id, String name) async {
    try {
      // This would need to be implemented in the API client
      await loadControllers(); // Reload to get updated data
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteController(int id) async {
    try {
      // This would need to be implemented in the API client
      await loadControllers(); // Reload to get updated data
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final controllersProvider = StateNotifierProvider<ControllersNotifier, AsyncValue<List<Controller>>>((ref) {
  return ControllersNotifier();
});

final controllerProvider = Provider.family<AsyncValue<Controller>, int>((ref, id) {
  final controllers = ref.watch(controllersProvider);
  return controllers.when(
    data: (controllers) {
      final controller = controllers.firstWhere((c) => c.id == id);
      return AsyncValue.data(controller);
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});
