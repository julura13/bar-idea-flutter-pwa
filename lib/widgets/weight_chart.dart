import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:iot_weight_pwa/models/weight_reading.dart';

class WeightChart extends StatelessWidget {
  final List<WeightReading> readings;

  const WeightChart({
    super.key,
    required this.readings,
  });

  @override
  Widget build(BuildContext context) {
    if (readings.isEmpty) {
      return const Center(
        child: Text(
          'No weight data available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    // Sort readings by time
    final sortedReadings = List<WeightReading>.from(readings)
      ..sort((a, b) => a.readAt.compareTo(b.readAt));

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: _getTimeInterval(sortedReadings),
              getTitlesWidget: (value, meta) {
                return _getTimeLabel(value, sortedReadings);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: _getWeightInterval(sortedReadings),
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}g',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.shade300),
        ),
        minX: 0,
        maxX: (sortedReadings.length - 1).toDouble(),
        minY: _getMinWeight(sortedReadings),
        maxY: _getMaxWeight(sortedReadings),
        lineBarsData: [
          LineChartBarData(
            spots: _getSpots(sortedReadings),
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.3),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  Theme.of(context).primaryColor.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _getSpots(List<WeightReading> readings) {
    return readings.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.weightValue);
    }).toList();
  }

  double _getMinWeight(List<WeightReading> readings) {
    if (readings.isEmpty) return 0;
    final minWeight = readings.map((r) => r.weightValue).reduce((a, b) => a < b ? a : b);
    return (minWeight * 0.9).roundToDouble();
  }

  double _getMaxWeight(List<WeightReading> readings) {
    if (readings.isEmpty) return 100;
    final maxWeight = readings.map((r) => r.weightValue).reduce((a, b) => a > b ? a : b);
    return (maxWeight * 1.1).roundToDouble();
  }

  double _getWeightInterval(List<WeightReading> readings) {
    final minWeight = _getMinWeight(readings);
    final maxWeight = _getMaxWeight(readings);
    final range = maxWeight - minWeight;
    return (range / 5).roundToDouble();
  }

  double _getTimeInterval(List<WeightReading> readings) {
    if (readings.length <= 5) return 1;
    return (readings.length / 5).roundToDouble();
  }

  Widget _getTimeLabel(double value, List<WeightReading> readings) {
    final index = value.round();
    if (index < 0 || index >= readings.length) return const Text('');
    
    final reading = readings[index];
    final time = reading.readAt;
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 60) {
      return Text(
        '${difference.inMinutes}m',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
    } else if (difference.inHours < 24) {
      return Text(
        '${difference.inHours}h',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
    } else {
      return Text(
        '${difference.inDays}d',
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
    }
  }
}
