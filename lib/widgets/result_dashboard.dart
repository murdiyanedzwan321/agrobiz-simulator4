import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/simulation_state.dart';

class ResultDashboard extends StatelessWidget {
  const ResultDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SimulationState>();
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    final percentFormat = NumberFormat.percentPattern();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Hasil Analisis",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: "Laba Bersih Bulanan",
          value: currencyFormat.format(state.monthlyNetProfit),
          color: state.monthlyNetProfit >= 0 ? Colors.green : Colors.red,
          icon: Icons.monetization_on,
        ),
         const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                title: "ROI (Tahunan)",
                value: "${state.roi.toStringAsFixed(1)}%",
                color: Colors.blue,
                icon: Icons.trending_up,
                isSmall: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildInfoCard(
                title: "BEP (Unit)",
                value: "${state.bepUnit.toStringAsFixed(0)} Unit",
                color: Colors.orange,
                icon: Icons.inventory_2,
                isSmall: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildInfoCard(
          title: "Total Investasi (CAPEX)",
          value: currencyFormat.format(state.totalCapex),
          color: Colors.grey[700]!,
          icon: Icons.business,
          isSmall: true,
        ),
        const SizedBox(height: 24),
        const Text("Proporsi Biaya Bulanan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                PieChartSectionData(
                  color: Colors.redAccent,
                  value: state.totalFixedCost,
                  title: 'Fixed',
                  radius: 50,
                  titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.orangeAccent,
                  value: state.variableCostPerUnit * state.salesTarget,
                  title: 'Variable',
                  radius: 50,
                  titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                 PieChartSectionData(
                  color: Colors.green,
                  value: state.monthlyNetProfit > 0 ? state.monthlyNetProfit : 0,
                  title: 'Profit',
                  radius: 60,
                  titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Wrap(
            spacing: 16,
            children: [
              _buildLegend(Colors.redAccent, "Fixed Cost"),
              _buildLegend(Colors.orangeAccent, "Variable Cost"),
              _buildLegend(Colors.green, "Profit"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
    bool isSmall = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: isSmall ? 20 : 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: isSmall ? 12 : 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(value,
                    style: TextStyle(
                        color: color,
                        fontSize: isSmall ? 16 : 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
