// Base Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// FL Chart
import 'package:fl_chart/fl_chart.dart';

class WeightProgressChart extends StatelessWidget {
  const WeightProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
              drawVerticalLine: true,
              verticalInterval: 1,
              drawHorizontalLine: true,
              horizontalInterval: 1,
              getDrawingVerticalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.1),
                strokeWidth: 1,
              ),
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.1),
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  getTitlesWidget: (value, _) {
                    return Text('${value.toInt()} lbs',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0));
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false), // Disable top labels
              ),
              rightTitles: const AxisTitles(
                sideTitles:
                    SideTitles(showTitles: false), // Disable right labels
              ),
            ),
            minX: 0,
            maxX: 3,
            minY: 160,
            maxY: 175,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 174.6),
                  const FlSpot(1, 172.5),
                  const FlSpot(2, 168.8),
                  const FlSpot(3, 166.7),
                ],
                isCurved: true,
                barWidth: 4,
                color: CupertinoTheme.of(context)
                    .primaryColor, // Match the theme color
                belowBarData: BarAreaData(
                  show: true,
                  color: CupertinoTheme.of(context)
                      .primaryColor
                      .withOpacity(0.3), // Purple shaded area
                ),
                dotData: const FlDotData(
                  show: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
