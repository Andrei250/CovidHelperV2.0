import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsWidget extends StatefulWidget {
  StatsWidget({this.lun,
    this.mar,
    this.mie,
    this.joi,
    this.vin,
    this.sam,
    this.dum,
    this.maximum,
    this.text});

  double lun;
  double mar;
  double mie;
  double joi;
  double vin;
  double sam;
  double dum;
  double maximum;
  String text;

  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          color: Colors.grey[100],
          child: Column(children: [
            Container(
              constraints: BoxConstraints(maxHeight: 200),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: widget.maximum + 6,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 8,
                      getTooltipItem: (BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          eStats,
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: eStats,
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'L';
                          case 1:
                            return 'Ma';
                          case 2:
                            return 'Mi';
                          case 3:
                            return 'J';
                          case 4:
                            return 'V';
                          case 5:
                            return 'S';
                          case 6:
                            return 'D';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          y: widget.lun, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          y: widget.mar, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          y: widget.mie, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                          y: widget.joi, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                          y: widget.vin, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                          y: widget.sam, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                          y: widget.dum, color: AppTheme.lightAccent)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Text(
                widget.text,
                style: eStats,
              ),
            )
          ]),
        ));
  }
}
