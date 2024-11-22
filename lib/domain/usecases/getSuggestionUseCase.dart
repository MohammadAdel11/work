import 'package:http/http.dart' as http;

class getSugesstionUseCase{


  getSugesstionUseCase({required String input});


  Future call()async{
    var url = Uri.https('api.openrouteservice.org', '/geocode/search');
    var response = await http.post(url, body: {'api_key': '5b3ce3597851110001cf62486930ed970a56438f8fc44b3f1d8ea02e', 'text': 'ramall'});
  }
}