import 'package:supabase_flutter/supabase_flutter.dart';

class JobRemoteDataSource {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  Future<void> insertJobData({
    required String id,
    required DateTime createdAt,
    required String category,
    required String location,
    required String description,
    DateTime? startDate, // Nullable
    double? cost,        // Nullable
    DateTime? endDate,   // Nullable
    required String status,
  }) async {
    final response = await supabaseClient.from('job').insert({
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'category': category,
      'location': location,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'cost': cost,
      'end_date': endDate?.toIso8601String(),
      'status': status,
    });

    if (response.error != null) {
      throw Exception("Failed to insert job data: ${response.error!.message}");
    }
  }
}
