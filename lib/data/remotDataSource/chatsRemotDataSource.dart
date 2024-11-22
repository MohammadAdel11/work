import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:herafi/domain/entites/chat.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entites/Message.dart';

class chatsRemotDataSource{
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot? document;

  Future<QuerySnapshot<Map<String, dynamic>>> fetchChats({required String userId})async{
    return await firestore.collection('chats').where("users",arrayContains: userId).get();
  }

  void _x()async{
    return await supabaseClient.from('users').insert({'name':'moa','id':FirebaseAuth.instance.currentUser!.uid});

  }
  Future<List<Map<String, dynamic>>> fetchUsersViaArrayOfIds(List<String> ids)async{
    return await supabaseClient.from('users').select().inFilter('id', ids);
  }
  Future  fetchMessages(chatEntity chat)async{
    final QuerySnapshot result;
    if(document==null)
    {
      result =await firestore
          .collection('chats')
          .doc(chat.documentId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .limit(20)
          .get();
    }
    else
    result = await firestore
        .collection('chats')
        .doc(chat.documentId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .startAfterDocument(document!)
        .limit(20)
        .get();

    if(result.docs.isNotEmpty)
      document=result.docs.last;
    return result;
  }
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>>  fetchStreamMessages(chatEntity chat)async{
    ///begining of new contact
    document=null;

    final Stream<QuerySnapshot<Map<String, dynamic>>> result;
      result =await firestore
          .collection('chats')
          .doc(chat.documentId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .limit(20)
          .snapshots();
    return result;
  }

  Future sendMessage(Message message)async{
    if(message.resource!=null){
      message.resource=await uplaodImage(message.resource!,'messageChannel');
    }
    await firestore.collection('chats').doc('chatId').collection('messages').add(message.toJson());
  }

  Future<String> uplaodImage(String resource,String channel)async{
    final result=await FirebaseStorage.instance.ref().child(channel).child('images/${FirebaseAuth.instance.currentUser?.uid}/${DateTime.now()}');
    await result.putFile(File(resource),SettableMetadata(contentType: "image/jpeg"));
    String url=await result.getDownloadURL();
    return url;
  }
}