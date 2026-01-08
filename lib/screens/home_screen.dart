import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/simulation_state.dart';
import '../widgets/input_forms.dart';
import '../widgets/result_dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AgroBiz Simulator: VCO"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<SimulationState>().reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Simulasi di-reset ke nilai awal")),
              );
            },
            tooltip: 'Reset Simulasi',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            // Desktop / Web Wide
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: _buildInputSection(context),
                  ),
                ),
                Container(width: 1, color: Colors.grey.shade300),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: const ResultDashboard(),
                  ),
                ),
              ],
            );
          } else {
            // Mobile
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const ResultDashboard(),
                const SizedBox(height: 24),
                const Divider(thickness: 2),
                const SizedBox(height: 16),
                _buildInputSection(context),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildInputSection(BuildContext context) {
    final state = context.watch<SimulationState>();
    final readState = context.read<SimulationState>();

    return Column(
      children: [
        InputGroup(
          title: "1. Investasi Awal (CAPEX)",
          children: [
            SliderInput(
              label: "Harga Mesin",
              value: state.machineryCost,
              max: 200000000,
              onChanged: (val) => readState.updateCapex(machine: val),
            ),
            const SizedBox(height: 8),
            SliderInput(
              label: "Renovasi Bangunan",
              value: state.buildingRenovationCost,
              max: 100000000,
              onChanged: (val) => readState.updateCapex(building: val),
            ),
            const SizedBox(height: 8),
            SliderInput(
              label: "Perizinan",
              value: state.licensingCost,
              max: 50000000,
              onChanged: (val) => readState.updateCapex(license: val),
            ),
          ],
        ),
        InputGroup(
          title: "2. Biaya Operasional (OPEX)",
          children: [
            SliderInput(
              label: "Bahan Baku (per unit)",
              value: state.rawMaterialCost,
              max: 100000,
              onChanged: (val) => readState.updateOpexVariable(material: val),
            ),
            const SizedBox(height: 8),
            SliderInput(
              label: "Kemasan (per unit)",
              value: state.packagingCost,
              max: 20000,
              onChanged: (val) => readState.updateOpexVariable(packing: val),
            ),
            const Divider(height: 32),
             SliderInput(
              label: "Gaji Tenaga Kerja (Total/Bulan)",
              value: state.laborCost,
              max: 50000000,
              onChanged: (val) => readState.updateOpexFixed(labor: val),
            ),
            const SizedBox(height: 8),
             SliderInput(
              label: "Listrik & Energi (Bulan)",
              value: state.energyCost,
              max: 10000000,
              onChanged: (val) => readState.updateOpexFixed(energy: val),
            ),
          ],
        ),
        InputGroup(
          title: "3. Target & Penjualan",
          children: [
            SliderInput(
              label: "Harga Jual Produk",
              value: state.sellingPrice,
              max: 200000,
              onChanged: (val) => readState.updateProduction(price: val),
            ),
            const SizedBox(height: 8),
            SliderInput(
              label: "Target Penjualan (Unit/Bulan)",
              value: state.salesTarget,
              min: 0,
              max: 5000,
              divisions: 500,
              prefix: '',
              onChanged: (val) => readState.updateProduction(sales: val),
            ),
          ],
        ),
      ],
    );
  }
}
