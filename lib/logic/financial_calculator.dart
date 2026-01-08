class FinancialCalculator {
  /// Menghitung Total Investasi Awal (CAPEX)
  static double calculateTotalCapex({
    required double workingCapital, // Modal Kerja / optional
    required double machineryCost,
    required double buildingRenovationCost,
    required double licensingCost, // Perizinan
  }) {
    return machineryCost + buildingRenovationCost + licensingCost + workingCapital;
  }

  /// Menghitung Biaya Operasional Tetap (Fixed Cost) per Bulan
  /// Contoh: Gaji, Listrik (jika dianggap tetap), Maintenance
  static double calculateFixedCost({
    required double laborCost,
    required double energyCost,
    required double otherFixedCosts,
  }) {
    return laborCost + energyCost + otherFixedCosts;
  }

  /// Menghitung Biaya Variabel (Variable Cost) per Unit
  /// Contoh: Bahan Baku, Kemasan per item
  static double calculateVariableCostPerUnit({
    required double rawMaterialCost,
    required double packagingCost,
  }) {
    return rawMaterialCost + packagingCost;
  }

  /// Menghitung BEP (Break Even Point) dalam Unit
  /// Rumus: Fixed Cost / (Harga Jual - Variable Cost)
  static double calculateBEPUnit({
    required double fixedCost,
    required double variableCostPerUnit,
    required double pricePerUnit,
  }) {
    double contributionMargin = pricePerUnit - variableCostPerUnit;
    if (contributionMargin <= 0) return 0; // Loss per unit, never breaks even
    return fixedCost / contributionMargin;
  }

  /// Menghitung BEP dalam Rupiah
  static double calculateBEPRupiah({
    required double bepUnit,
    required double pricePerUnit,
  }) {
    return bepUnit * pricePerUnit;
  }

  /// Menghitung Estimasi Laba Bersih Bulanan (Net Profit)
  static double calculateMonthlyNetProfit({
    required double productionTarget, // Unit yang terjual
    required double pricePerUnit,
    required double fixedCost,
    required double variableCostPerUnit,
  }) {
    double revenue = productionTarget * pricePerUnit;
    double totalVariableCost = productionTarget * variableCostPerUnit;
    double totalCost = fixedCost + totalVariableCost;
    return revenue - totalCost;
  }

  /// Menghitung ROI (Return on Investment) Tahunan
  /// Rumus: (Laba Setahun / Total Investasi) * 100%
  static double calculateROI({
    required double monthlyNetProfit,
    required double totalCapex,
  }) {
    if (totalCapex == 0) return 0;
    double annualProfit = monthlyNetProfit * 12;
    return (annualProfit / totalCapex) * 100;
  }
}
