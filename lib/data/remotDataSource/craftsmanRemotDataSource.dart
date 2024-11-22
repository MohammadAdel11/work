import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CraftsmanRemoteDataSource {
  final SupabaseClient client;
  final FirebaseAuth firebaseAuth;

  CraftsmanRemoteDataSource(this.client, this.firebaseAuth);

  /// Fetch craftsman details by ID
Future<Map<String, dynamic>?> fetchCraftsmanDetails(String id) async {
  // Fetch data from both `users` and `craftsman` tables
  final response = await client
      .from('craftsman')
      .select('*, users(*)') // Join craftsman and associated user data
      .eq('id', id)
      .maybeSingle();

  if (response == null) {
    throw Exception('No craftsman details found for ID: $id');
  }

  // Combine the craftsman data and user data for convenience
  final Map<String, dynamic> combinedData = {
    'id': response['id'],
    'category': response['category'],
    'years_of_experience': response['years_of_experience'],
    ...response['users'], // Spread the user data into this map
  };

  return combinedData;
}


  /// Save craftsman details
  Future<void> saveCraftsmanDetails({
    required String category,
    required int yearsOfExperience,
    required String name,
    required String location,
    required String phoneNumber,
    required DateTime dateOfBirth,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated in Firebase');
    }
    final String uid = user.uid;

    // Insert user data into `users` table
    await client.from('users').upsert({
      'id': uid,
      'name': name,
      'phone_number': phoneNumber,
      'user_type': 'craftsman',
      'location': location,
      'date_of_birth': dateOfBirth.toIso8601String(),
    });

    // Insert craftsman data into `craftsman` table
    await client.from('craftsman').upsert({
      'id': uid,
      'category': category,
      'years_of_experience': yearsOfExperience,
    });
  }

  /// Update craftsman details
  Future<void> updateCraftsmanDetails({
    required String id,
    required String name,
    required String location,
    required DateTime dateOfBirth,
    required int yearsOfExperience,
    required String category,
    required String image,
  }) async {
    await client.from('users').update({
      'name': name,
      'location': location,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'image': image,
    }).eq('id', id);

    await client.from('craftsman').update({
      'years_of_experience': yearsOfExperience,
      'category': category,
    }).eq('id', id);
  }
}
