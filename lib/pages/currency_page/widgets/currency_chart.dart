import 'package:currency_app/colors/app_colors.dart';
import 'package:currency_app/pages/currency_page/classes/calculate_y.dart';
import 'package:currency_app/web_api/dto/rates.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyChart extends StatelessWidget {
  final int valueOfDays;
  final List<Rates>? rates;
  final double defaultMinY;
  final double defaultMaxY;
  const CurrencyChart(
      {super.key,
      required this.valueOfDays,
      required this.rates,
      required this.defaultMinY,
      required this.defaultMaxY});

  @override
  Widget build(BuildContext context) {
    final calculatorY = CalculatorY(
      rates: rates,
      defaultMinY: rates?.first.mid ?? defaultMinY,
      defaultMaxY: rates?.first.mid ?? defaultMaxY,
    );
    final textStyle = TextStyle(
      fontSize: 10,
      color: AppColors.grey,
    );
    return Padding(
      padding: const EdgeInsets.only(
        right: 22,
        left: 12,
        top: 24,
        bottom: 12,
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: valueOfDays.toDouble() - 1,
          minY: calculatorY.roundedMinY - 0.05,
          maxY: calculatorY.roundedMaxY + 0.05,
          titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(),
              rightTitles: AxisTitles(),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value == meta.min) return const SizedBox();
                  return Text(
                    value.toStringAsFixed(2),
                    style: textStyle,
                  );
                },
              )),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (rates != null) {
                    if (value.toInt() >= rates!.length) {
                      return const SizedBox();
                    }
                    return Text(
                        _getFormattedDate(rates![value.toInt()].effectiveDate!),
                        style: textStyle);
                  } else {
                    return Text(
                      "${value.toInt() + 1}.04",
                      style: textStyle,
                    );
                  }
                },
              ))),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white24,
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.white24,
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
                spots: rates != null ? _getListOfSpots(rates!) : null,
                isCurved: true,
                color: Theme.of(context).primaryColor,
                barWidth: 4,
                belowBarData: BarAreaData(
                  show: true,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                )),
          ],
        ),
      ),
    );
  }

  String _getFormattedDate(String date) {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd.MM').format(dateTime);
  }

  List<FlSpot> _getListOfSpots(List<Rates> rates) {
    final List<FlSpot> spots = [];
    for (int i = 0; i < rates.length; i++) {
      final spot = FlSpot(i.toDouble(), rates[i].mid!);
      spots.add(spot);
    }
    return spots;
  }
}
