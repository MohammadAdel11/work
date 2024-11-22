import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerRemoteDataSource {
  final SupabaseClient client;

  CustomerRemoteDataSource(this.client);

  Future<Map<String, dynamic>?> fetchCustomerDetails(String id) async {
    final response = await client
        .from('customer_details')
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) {
      throw Exception('No customer details found for ID: $id');
    }

    return response as Map<String, dynamic>;
  }

  Future<void> saveCustomerDetails(Map<String, dynamic> customerJson) async {
    await client.from('customer_details').upsert(customerJson);
    print('Customer details saved successfully.');
  }
}
