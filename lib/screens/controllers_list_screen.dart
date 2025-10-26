import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_weight_pwa/providers/auth_provider.dart';
import 'package:iot_weight_pwa/providers/controllers_provider.dart';
import 'package:iot_weight_pwa/models/controller.dart';

class ControllersListScreen extends ConsumerWidget {
  const ControllersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final controllersState = ref.watch(controllersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controllers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(controllersProvider.notifier).loadControllers(),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                ref.read(authProvider.notifier).logout();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // User info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${authState.client?.name ?? 'User'}!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  authState.client?.email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          
          // Controllers list
          Expanded(
            child: controllersState.when(
              data: (controllers) => controllers.isEmpty
                  ? _buildEmptyState(context)
                  : _buildControllersList(context, controllers),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error loading controllers: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.read(controllersProvider.notifier).loadControllers(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddControllerDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.device_hub,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No controllers found',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first controller to get started',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showAddControllerDialog(context, null),
            icon: const Icon(Icons.add),
            label: const Text('Add Controller'),
          ),
        ],
      ),
    );
  }

  Widget _buildControllersList(BuildContext context, List<Controller> controllers) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controllers.length,
      itemBuilder: (context, index) {
        final controller = controllers[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
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
            title: Text(controller.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MAC: ${controller.macAddress}'),
                Text('Modules: ${controller.weighModules.length}'),
                if (controller.lastSeenAt != null)
                  Text('Last seen: ${_formatDateTime(controller.lastSeenAt!)}'),
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
              onSelected: (value) {
                if (value == 'edit') {
                  _showEditControllerDialog(context, ref, controller);
                } else if (value == 'delete') {
                  _showDeleteControllerDialog(context, ref, controller);
                }
              },
            ),
            onTap: () => context.go('/controllers/${controller.id}'),
          ),
        );
      },
    );
  }

  void _showAddControllerDialog(BuildContext context, WidgetRef? ref) {
    final nameController = TextEditingController();
    final macController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Controller'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Controller Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: macController,
              decoration: const InputDecoration(
                labelText: 'MAC Address',
                border: OutlineInputBorder(),
                hintText: 'AA:BB:CC:DD:EE:FF',
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
              if (nameController.text.isNotEmpty && macController.text.isNotEmpty) {
                ref?.read(controllersProvider.notifier).createController(
                  macController.text,
                  nameController.text,
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditControllerDialog(BuildContext context, WidgetRef ref, Controller controller) {
    final nameController = TextEditingController(text: controller.name);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Controller'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Controller Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                ref.read(controllersProvider.notifier).updateController(
                  controller.id,
                  nameController.text,
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

  void _showDeleteControllerDialog(BuildContext context, WidgetRef ref, Controller controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Controller'),
        content: Text('Are you sure you want to delete "${controller.name}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(controllersProvider.notifier).deleteController(controller.id);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
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
