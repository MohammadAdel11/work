// import 'package:herafi/data/models/WorkModel.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class WorksRemoteDataSource {
//   final SupabaseClient client;

//   WorksRemoteDataSource(this.client);

//   /// Fetch works for a given craftsman ID
//   Future<List<WorkModel>> fetchWorks(String craftsmanId) async {
//     final response = await client
//         .from('works')
//         .select('*')
//         .eq('craftsman_id', craftsmanId)
//         .order('created_at', ascending: false);

  

//     return (response as List).map((work) => WorkModel.fromJson(work)).toList();
//   }

//   /// Insert a new work into the database
//   Future<void> insertWork(WorkModel work) async {
//     final response = await client.from('works').insert(work.toJson());

//     if (response.hasError) {
//       throw Exception('Failed to insert work: ${response.error!.message}');
//     }
//   }
// }