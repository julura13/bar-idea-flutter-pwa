import 'package:flutter/material.dart';

class CommandButtons extends StatelessWidget {
  final VoidCallback onRead;
  final VoidCallback onTare;
  final VoidCallback onCalibrate;
  final Function(Color) onLedColorChange;

  const CommandButtons({
    super.key,
    required this.onRead,
    required this.onTare,
    required this.onCalibrate,
    required this.onLedColorChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary commands row
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onRead,
                icon: const Icon(Icons.scale),
                label: const Text('Read Weight'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onTare,
                icon: const Icon(Icons.balance),
                label: const Text('Tare'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Secondary commands row
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onCalibrate,
                icon: const Icon(Icons.tune),
                label: const Text('Calibrate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _showColorPicker(context),
                icon: const Icon(Icons.color_lens),
                label: const Text('LED Color'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.cyan,
      Colors.teal,
      Colors.indigo,
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select LED Color'),
        content: SizedBox(
          width: 300,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return GestureDetector(
                onTap: () {
                  onLedColorChange(color);
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
