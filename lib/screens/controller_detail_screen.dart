import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_weight_pwa/providers/controllers_provider.dart';
import 'package:iot_weight_pwa/providers/modules_provider.dart';
import 'package:iot_weight_pwa/models/controller.dart';
import 'package:iot_weight_pwa/models/weigh_module.dart';

class ControllerDetailScreen extends ConsumerWidget {
  final String controllerId;
  
  const ControllerDetailScreen({
    super.key,
    required this.controllerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(controllerProvider(int.parse(controllerId)));
    final modulesState = ref.watch(modulesProvider(int.parse(controllerId)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(controllersProvider.notifier).loadControllers();
              ref.read(modulesProvider(int.parse(controllerId)).notifier).loadModules();
            },
          ),
        ],
      ),
      body: controllerState.when(
        data: (controller) => Column(
          children: [
            // Controller info card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: controller.status == 'online' 
                              ? Colors.green 
                              : Colors.grey,
                          child: Icon(
                            controller.status == 'online' 
                                ? Icons.wifi 
                                : Icons.wifi_off,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Status: ${controller.status.toUpperCase()}',
                                style: TextStyle(
                                  color: controller.status == 'online' 
                                      ? Colors.green 
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('MAC Address', controller.macAddress),
                    if (controller.lastSeenAt != null)
                      _buildInfoRow('Last Seen', _formatDateTime(controller.lastSeenAt!)),
                    if (controller.ipAddress != null)
                      _buildInfoRow('IP Address', controller.ipAddress!),
                    _buildInfoRow('Total Modules', '${controller.weighModules.length}'),
                  ],
                ),
              ),
            ),
            
            // Modules section
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weigh Modules',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _showAddModuleDialog(context, ref),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Module'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Modules list
                  Expanded(
                    child: modulesState.when(
                      data: (modules) => modules.isEmpty
                          ? _buildEmptyModulesState(context)
                          : _buildModulesList(context, ref, modules),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error, size: 64, color: Colors.red),
                            const SizedBox(height: 16),
                            Text('Error loading modules: $error'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref.read(modulesProvider(int.parse(controllerId)).notifier).loadModules(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading controller: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(controllersProvider.notifier).loadControllers(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildEmptyModulesState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.scale,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No modules found',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first weigh module to get started',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showAddModuleDialog(context, null),
            icon: const Icon(Icons.add),
            label: const Text('Add Module'),
          ),
        ],
      ),
    );
  }

  Widget _buildModulesList(BuildContext context, WidgetRef ref, List<WeighModule> modules) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: modules.length,
      itemBuilder: (context, index) {
        final module = modules[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _hexToColor(module.defaultLedColor),
              child: Text(
                '${module.busChannel}${module.address}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(module.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bus: ${module.busChannel}, Address: ${module.address}'),
                if (module.latestReading != null)
                  Text('Weight: ${module.latestReading!.weightValue}${module.latestReading!.unit}'),
                Text('Status: ${module.isActive ? 'Active' : 'Inactive'}'),
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
              onSelected: (value) => _handleModuleMenuSelection(context, ref, value, module),
            ),
            onTap: () => context.go('/modules/${module.id}'),
          ),
        );
      },
    );
  }

  void _handleModuleMenuSelection(BuildContext context, WidgetRef ref, String? value, WeighModule module) {
    if (value == 'edit') {
      _showEditModuleDialog(context, ref, module);
    } else if (value == 'delete') {
      _showDeleteModuleDialog(context, ref, module);
    }
  }

  void _showAddModuleDialog(BuildContext context, WidgetRef? ref) {
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    String busChannel = 'A';
    final colorController = TextEditingController(text: '#00FF00');
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Module'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Module Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: busChannel,
                        decoration: const InputDecoration(
                          labelText: 'Bus Channel',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'A', child: Text('A')),
                          DropdownMenuItem(value: 'B', child: Text('B')),
                        ],
                        onChanged: (value) => setState(() => busChannel = value!),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          labelText: 'Address (1-31)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: colorController,
                  decoration: const InputDecoration(
                    labelText: 'LED Color (hex)',
                    border: OutlineInputBorder(),
                    hintText: '#00FF00',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && 
                    addressController.text.isNotEmpty) {
                  final address = int.tryParse(addressController.text);
                  if (address != null && address >= 1 && address <= 31) {
                    ref?.read(modulesProvider(int.parse(controllerId)).notifier).createModule({
                      'bus_channel': busChannel,
                      'address': address,
                      'name': nameController.text,
                      'default_led_color': colorController.text,
                    });
                    Navigator.of(context).pop();
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditModuleDialog(BuildContext context, WidgetRef ref, WeighModule module) {
    final nameController = TextEditingController(text: module.name);
    final colorController = TextEditingController(text: module.defaultLedColor);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Module'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Module Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: colorController,
              decoration: const InputDecoration(
                labelText: 'LED Color (hex)',
                border: OutlineInputBorder(),
                hintText: '#00FF00',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                ref.read(modulesProvider(int.parse(controllerId)).notifier).updateModule(
                  module.id,
                  {
                    'name': nameController.text,
                    'default_led_color': colorController.text,
                  },
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteModuleDialog(BuildContext context, WidgetRef ref, WeighModule module) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Module'),
        content: Text('Are you sure you want to delete "${module.name}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(modulesProvider(int.parse(controllerId)).notifier).deleteModule(module.id);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Color _hexToColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
