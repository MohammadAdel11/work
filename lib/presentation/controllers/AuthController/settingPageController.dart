import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class settingPageController extends GetxController{


  void contactAdham(){
    launchUrl(Uri.parse("https://wa.me/+970595722162"));
  }

  void navigateBack(){
    Get.back();
  }
}