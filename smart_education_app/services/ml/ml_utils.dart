class MLUtils {
  // Normalize input data for ML models
  static List<double> normalizeData(List<double> data) {
    final maxVal = data.reduce((a, b) => a > b ? a : b);
    return data.map((value) => value / maxVal).toList();
  }

  // Calculate learning progress percentage
  static double calculateProgress(int completedModules, int totalModules) {
    if (totalModules == 0) return 0.0;
    return (completedModules / totalModules) * 100;
  }

  // Basic scoring function
  static double calculateScore(Map<String, dynamic> performanceMetrics) {
    final accuracy = performanceMetrics['accuracy'] ?? 0;
    final participation = performanceMetrics['participation'] ?? 0;
    final assignments = performanceMetrics['assignments'] ?? 0;
    return (accuracy * 0.5) + (participation * 0.3) + (assignments * 0.2);
  }
}
