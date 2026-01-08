import 'package:flutter/foundation.dart';
import '../logic/financial_calculator.dart';

class SimulationState extends ChangeNotifier {
  // --- CAPEX (Investasi) ---
  double machineryCost = 50000000; // 50 Juta
  double buildingRenovationCost = 20000000; // 20 Juta
  double licensingCost = 5000000; // 5 Juta

  // --- OPEX (Operasional Variables - Per Unit) ---
  double rawMaterialCost = 15000; // Per unit
  double packagingCost = 5000; // Per unit

  // --- OPEX (Operasional Fixed - Per Bulan) ---
  double laborCost = 5000000; // Gaji total
  double energyCost = 1000000; // Listrik/Air
  double otherFixedCosts = 500000; // Lain-lain

  // --- Target & Sales ---
  double productionCapacity = 1000; // Unit per bulan
  double salesTarget = 800; // Unit terjual (Asumsi terjual semua = salesTarget)
  double sellingPrice = 50000; // Harga per unit

  // --- Calculated Results (Getters) ---
  
  double get totalCapex => FinancialCalculator.calculateTotalCapex(
    workingCapital: 0, 
    machineryCost: machineryCost, 
    buildingRenovationCost: buildingRenovationCost, 
    licensingCost: licensingCost
  );

  double get totalFixedCost => FinancialCalculator.calculateFixedCost(
    laborCost: laborCost, 
    energyCost: energyCost, 
    otherFixedCosts: otherFixedCosts
  );

  double get variableCostPerUnit => FinancialCalculator.calculateVariableCostPerUnit(
    rawMaterialCost: rawMaterialCost, 
    packagingCost: packagingCost
  );

  double get bepUnit => FinancialCalculator.calculateBEPUnit(
    fixedCost: totalFixedCost, 
    variableCostPerUnit: variableCostPerUnit, 
    pricePerUnit: sellingPrice
  );

  double get bepRupiah => FinancialCalculator.calculateBEPRupiah(
    bepUnit: bepUnit, 
    pricePerUnit: sellingPrice
  );

  double get monthlyNetProfit => FinancialCalculator.calculateMonthlyNetProfit(
    productionTarget: salesTarget, 
    pricePerUnit: sellingPrice, 
    fixedCost: totalFixedCost, 
    variableCostPerUnit: variableCostPerUnit
  );

  double get roi => FinancialCalculator.calculateROI(
    monthlyNetProfit: monthlyNetProfit, 
    totalCapex: totalCapex
  );

  // --- Methods to Update State ---

  void updateCapex({double? machine, double? building, double? license}) {
    if (machine != null) machineryCost = machine;
    if (building != null) buildingRenovationCost = building;
    if (license != null) licensingCost = license;
    notifyListeners();
  }

  void updateOpexVariable({double? material, double? packing}) {
    if (material != null) rawMaterialCost = material;
    if (packing != null) packagingCost = packing;
    notifyListeners();
  }

  void updateOpexFixed({double? labor, double? energy, double? others}) {
    if (labor != null) laborCost = labor;
    if (energy != null) energyCost = energy;
    if (others != null) otherFixedCosts = others;
    notifyListeners();
  }

  void updateProduction({double? capacity, double? sales, double? price}) {
    if (capacity != null) productionCapacity = capacity;
    if (sales != null) salesTarget = sales;
    if (price != null) sellingPrice = price;
    notifyListeners();
  }

  void reset() {
    machineryCost = 50000000;
    buildingRenovationCost = 20000000;
    licensingCost = 5000000;
    rawMaterialCost = 15000;
    packagingCost = 5000;
    laborCost = 5000000;
    energyCost = 1000000;
    otherFixedCosts = 500000;
    productionCapacity = 1000;
    salesTarget = 800;
    sellingPrice = 50000;
    notifyListeners();
  }
}
