import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somadome_p/res/constatnts/AppColors.dart';

class GraphWidget extends StatelessWidget {
  final int currentDayIndex; // 0 = Sat, 1 = Sun ... 6 = Fri

  const GraphWidget({super.key, required this.currentDayIndex});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final yourLine = [3, 2, 5, 3.5, 4, 3, 4];
    final communityLine = [4, 3, 4, 5, 3, 4, 2];

    return Container(
      decoration: BoxDecoration(
      //  gradient: AppColors.backgroundgradient,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- Legend Column (Top Left) ---
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegend(Colors.pinkAccent, "You"),
              const SizedBox(height: 6),
              _buildLegend(Colors.blueAccent, "Community"),
            ],
          ),
          const SizedBox(height: 8),

          /// --- Chart Section ---
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      interval: 1, // 🔥 ensures no repetition
                      getTitlesWidget: (value, meta) {
                        const days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
                        if (value.toInt() < 0 || value.toInt() >= days.length) {
                          return const SizedBox.shrink();
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            days[value.toInt()],
                            style: GoogleFonts.poppins(
                              color: value.toInt() == currentDayIndex
                                  ? Colors.redAccent
                                  : Colors.white,
                              fontWeight: value.toInt() == currentDayIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  /// --- Your Line (Pink) ---
                  LineChartBarData(
                    spots: List.generate(
                        yourLine.length, (i) => FlSpot(i.toDouble(), yourLine[i].toDouble())),
                    isCurved: true,
                    color: Colors.pinkAccent,
                    barWidth: 2,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) {
                        if (index == currentDayIndex) {
                          return FlDotCirclePainter(
                            radius: 6,
                            color: Colors.white,
                            strokeWidth: 2,
                            strokeColor: Colors.pinkAccent,
                          );
                        }
                        return FlDotCirclePainter(radius: 0, color: Colors.transparent);
                      },
                    ),
                  ),

                  /// --- Community Line (Blue) ---
                  LineChartBarData(
                    spots: List.generate(
                        communityLine.length, (i) => FlSpot(i.toDouble(), communityLine[i].toDouble())),
                    isCurved: true,
                    color: Colors.blueAccent,
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                  ),

                  /// --- Inner Red Dot for Today ---
                  LineChartBarData(
                    spots: [
                      FlSpot(currentDayIndex.toDouble(), yourLine[currentDayIndex].toDouble())
                    ],
                    isCurved: false,
                    color: Colors.transparent,
                    barWidth: 0,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                        radius: 3,
                        color: Colors.red,
                        strokeWidth: 0,
                      ),
                    ),
                  ),
                ],
                lineTouchData: const LineTouchData(enabled: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Legend Widget
  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(text, style:  GoogleFonts.poppins(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w600)),
      ],
    );
  }
}
