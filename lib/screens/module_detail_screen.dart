import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_weight_pwa/core/api_client.dart';
import 'package:iot_weight_pwa/providers/modules_provider.dart';
import 'package:iot_weight_pwa/models/weigh_module.dart';
import 'package:iot_weight_pwa/models/weight_reading.dart';
import 'package:iot_weight_pwa/widgets/weight_chart.dart';
import 'package:iot_weight_pwa/widgets/command_buttons.dart';

class ModuleDetailScreen extends ConsumerStatefulWidget {
  final String moduleId;
  
  const ModuleDetailScreen({
    super.key,
    required this.moduleId,
  });

  @override
  ConsumerState<ModuleDetailScreen> createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends ConsumerState<ModuleDetailScreen> {
  Color _selectedColor = Colors.green;
  
  @override
  Widget build(BuildContext context) {
    final moduleStats = ref.watch(moduleStatsProvider(int.parse(widget.moduleId)));
    final readings = ref.watch(readingsProvider(int.parse(widget.moduleId)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Module Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(moduleStatsProvider(int.parse(widget.moduleId)).notifier).loadStats();
              ref.read(readingsProvider(int.parse(widget.moduleId)).notifier).loadReadings();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Module info card
            _buildModuleInfoCard(context),
            const SizedBox(height: 16),
            
            // Current weight display
            _buildCurrentWeightCard(context, moduleStats),
            const SizedBox(height: 16),
            
            // Command buttons
            _buildCommandSection(context),
            const SizedBox(height: 16),
            
            // Statistics
            _buildStatsCard(context, moduleStats),
            const SizedBox(height: 16),
            
            // Weight chart
            _buildWeightChart(context, readings),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Module Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Module ID', widget.moduleId),
            _buildInfoRow('Status', 'Active'),
            _buildInfoRow('Last Updated', 'Just now'),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeightCard(BuildContext context, AsyncValue<Map<String, dynamic>> moduleStats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Current Weight',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            moduleStats.when(
              data: (stats) {
                final latestReading = stats['latest_reading'];
                if (latestReading != null) {
                  return Column(
                    children: [
                      Text(
                        '${latestReading['weight_value']} ${latestReading['unit']}',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Last reading: ${_formatDateTime(DateTime.parse(latestReading['read_at']))}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                } else {
                  return Text(
                    'No readings available',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  );
                }
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text(
                'Error loading weight: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommandSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Commands',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Command buttons
            CommandButtons(
              onRead: () => _sendCommand('READ', ''),
              onTare: () => _sendCommand('TARE', ''),
              onCalibrate: () => _showCalibrateDialog(context),
              onLedColorChange: (color) => _sendLedCommand(color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, AsyncValue<Map<String, dynamic>> moduleStats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics (24h)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            moduleStats.when(
              data: (stats) => Column(
                children: [
                  _buildStatRow('Total Readings', '${stats['total_readings'] ?? 0}'),
                  _buildStatRow('Average Weight', '${stats['avg_weight_24h']?.toStringAsFixed(2) ?? 'N/A'}g'),
                  _buildStatRow('Max Weight', '${stats['max_weight_24h']?.toStringAsFixed(2) ?? 'N/A'}g'),
                  _buildStatRow('Min Weight', '${stats['min_weight_24h']?.toStringAsFixed(2) ?? 'N/A'}g'),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text(
                'Error loading stats: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightChart(BuildContext context, AsyncValue<List<WeightReading>> readings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weight History (Last 24h)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: readings.when(
                data: (readings) => WeightChart(readings: readings),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Text(
                    'Error loading chart: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
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
            width: 120,
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

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _sendCommand(String commandType, String payload) async {
    try {
      await ApiClient.sendCommand(
        widget.moduleId,
        commandType,
        payload,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$commandType command sent successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send command: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _sendLedCommand(Color color) {
    final r = color.red;
    final g = color.green;
    final b = color.blue;
    _sendCommand('LED', '$r $g $b');
  }

  void _showCalibrateDialog(BuildContext context) {
    final weightController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Calibrate Module'),
        content: TextField(
          controller: weightController,
          decoration: const InputDecoration(
            labelText: 'Known Weight (grams)',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (weightController.text.isNotEmpty) {
                _sendCommand('CAL', weightController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Calibrate'),
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
