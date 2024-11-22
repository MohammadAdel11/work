import 'package:herafi/domain/entites/job.dart';

class JobModel extends JobEntity {
  JobModel({
    required super.id,
    required super.createdAt,
    required super.category,
    required super.location,
    required super.description,
    super.startDate, // Nullable
    super.cost,      // Nullable
    super.endDate,   // Nullable
    required super.status,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'].toString(),
      createdAt: DateTime.parse(json['created_at']),
      location: json['location'],
      category: json['category'],
      description: json['description'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      cost: json['cost'] != null ? (json['cost'] as num).toDouble() : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'category': category,
      'location': location,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'cost': cost,
      'end_date': endDate?.toIso8601String(),
      'status': status,
    };
  }
}
