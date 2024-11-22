import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class userRemotDataSource{
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<PostgrestList> fetchUserData({required String userId})async{
    return (await supabaseClient.from('users').select('*').eq('id', userId));
  }
}