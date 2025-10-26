import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_weight_pwa/core/api_client.dart';
import 'package:iot_weight_pwa/models/weigh_module.dart';
import 'package:iot_weight_pwa/models/weight_reading.dart';

class ModulesNotifier extends StateNotifier<AsyncValue<List<WeighModule>>> {
  final int controllerId;
  
  ModulesNotifier(this.controllerId) : super(const AsyncValue.loading()) {
    loadModules();
  }

  Future<void> loadModules() async {
    try {
      state = const AsyncValue.loading();
      final modulesData = await ApiClient.getModules(controllerId.toString());
      final modules = modulesData
          .map((data) => WeighModule.fromJson(data))
          .toList();
      state = AsyncValue.data(modules);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createModule(Map<String, dynamic> moduleData) async {
    try {
      final moduleResponse = await ApiClient.createModule(controllerId.toString(), moduleData);
      final newModule = WeighModule.fromJson(moduleResponse);
      
      state.whenData((modules) {
        state = AsyncValue.data([...modules, newModule]);
      });
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateModule(int id, Map<String, dynamic> moduleData) async {
    try {
      await ApiClient.updateModule(id.toString(), moduleData);
      await loadModules(); // Reload to get updated data
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> deleteModule(int id) async {
    try {
      // This would need to be implemented in the API client
      await loadModules(); // Reload to get updated data
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final modulesProvider = StateNotifierProvider.family<ModulesNotifier, AsyncValue<List<WeighModule>>, int>((ref, controllerId) {
  return ModulesNotifier(controllerId);
});

final moduleProvider = Provider.family<AsyncValue<WeighModule>, int>((ref, id) {
  // This would need to be implemented to get a single module
  return const AsyncValue.loading();
});

class ReadingsNotifier extends StateNotifier<AsyncValue<List<WeightReading>>> {
  final int moduleId;
  
  ReadingsNotifier(this.moduleId) : super(const AsyncValue.loading()) {
    loadReadings();
  }

  Future<void> loadReadings({String? from, String? to, int? limit}) async {
    try {
      state = const AsyncValue.loading();
      final readingsData = await ApiClient.getReadings(
        moduleId.toString(),
        from: from,
        to: to,
        limit: limit,
      );
      final readings = readingsData
          .map((data) => WeightReading.fromJson(data))
          .toList();
      state = AsyncValue.data(readings);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final readingsProvider = StateNotifierProvider.family<ReadingsNotifier, AsyncValue<List<WeightReading>>, int>((ref, moduleId) {
  return ReadingsNotifier(moduleId);
});

class ModuleStatsNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final int moduleId;
  
  ModuleStatsNotifier(this.moduleId) : super(const AsyncValue.loading()) {
    loadStats();
  }

  Future<void> loadStats() async {
    try {
      state = const AsyncValue.loading();
      final stats = await ApiClient.getModuleStats(moduleId.toString());
      state = AsyncValue.data(stats);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final moduleStatsProvider = StateNotifierProvider.family<ModuleStatsNotifier, AsyncValue<Map<String, dynamic>>, int>((ref, moduleId) {
  return ModuleStatsNotifier(moduleId);
});
