import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:herafi/data/remotDataSource/chatsRemotDataSource.dart';
import '../../core/status/error/Failure.dart';
import '../../domain/entites/Message.dart';
import '../../domain/entites/chat.dart';
import '../../domain/repositories/ChatRepository.dart';
import '../models/chatModel.dart';


class ChatRepositoryImpl implements ChatRepository {
  final chatsRemotDataSource remoteDataSource;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> sendMessage(Message message) async {
    try {
      await remoteDataSource.sendMessage(message);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to send message'));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages(chatEntity chat) async {
    try {
      final QuerySnapshot querySnapshot =await remoteDataSource.fetchMessages(chat);

      List<Message> messages = querySnapshot.docs.map((doc) {
        return Message(
          senderId: doc['senderId'],
          text: doc['text'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
        );
      }).toList();

      return Right(messages);
    } catch (e) {
      return Left(DatabaseFailure('Failed to load messages'));
    }
  }
  @override
  Future<Either<Failure, Stream<List<Message>>>> getStreamMessages(chatEntity chat) async {
    try {
      final Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =await remoteDataSource.fetchStreamMessages(chat);

      Stream<List<Message>> messages = querySnapshot.map((snapshot) {
        return snapshot.docs.map((doc) {
            return Message(
              senderId: doc['senderId'],
              text: doc['text'],
              timestamp: (doc['timestamp'] as Timestamp).toDate(),
              resource: doc.data().containsKey('resource')?doc['resource']:null
            );
        }
        ).toList();
      });

      return Right(messages);
    } catch (e) {
      return Left(DatabaseFailure('Failed to load messages'));
    }
  }

  Future<Either<Failure,List<chatEntity>>> fetchChats(String userId)async{
    try{
      final QuerySnapshot<Map<String, dynamic>> x=await remoteDataSource.fetchChats(userId: userId);

      if(x.docs.isEmpty)return Right([]);
      /// get user ids
      List<String> userIdForFetching=[];
      x.docs.forEach((document){
        final List users=document.data()['users'];
        users.remove(userId);
        userIdForFetching.add(users.first);
      });
      

      final List<Map<String, dynamic>> users=await remoteDataSource.fetchUsersViaArrayOfIds(userIdForFetching);
      final List<chatEntity> chats=[];
      
      x.docs.forEach((doc){
        Map userData=_getFreindUser(users,doc.data()['users'],userId);
        chats.add(chatModel.fromJson({...doc.data(),...userData,"documentId":doc.id}));
      });
      
      return Right(chats);
    }
    catch(e){
      return Left(DatabaseFailure(e.toString()));
    }
  }
  Map _getFreindUser(List<Map> usersData,List usersIds,String myId){
    usersIds.remove(myId);
    final freindId=usersIds.first;
    for (var value in usersData) {
      if(value['id']==freindId){
        return value;
      }
    }
    return Map();

  }
}
