class JobEntity {
  final String id;
  final DateTime createdAt;
  final String category;
  final String location;
  final String description;
  final DateTime? startDate; // Nullable
  final double? cost;        // Nullable
  final DateTime? endDate;   // Nullable
  final String status;

  JobEntity({
    required this.id,
    required this.createdAt,
    required this.category,
    required this.location,
    required this.description,
    this.startDate, // Nullable
    this.cost,      // Nullable
    this.endDate,   // Nullable
    required this.status,
  });
}
