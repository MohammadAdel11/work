import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:herafi/presentation/Widgets/liveLocationMarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../routes/app_routes.dart';


class trackingPageController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();
  MapController mapController=MapController();
  RxList<Marker> markers=<Marker>[].obs;
  late Rx<LocationData> userLocation;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserLocation();
  }
///one-one
  void getUserLocation()async{
    try{
      var location=Location();
      await location.requestPermission();
      userLocation=(await location.getLocation()).obs;
      for(int i=0;i<5;i++){
        markers.value.add(Marker(point: LatLng(userLocation.value.latitude!+i,userLocation.value.longitude!), child: liveLocationMarker(),width: 100,height: 100));
        mapController.move(LatLng(userLocation.value.latitude!+i, userLocation.value.longitude!), 17);
        await Future.delayed(Duration(seconds: 1));
      }

      markers.refresh();
    }
    catch(e){
      print(e.toString());
    }
  }
  void m(){

  }
  void openDrawer(){
    scaffoldKey.currentState!.openDrawer();
  }
  void closeDrawer(){
    scaffoldKey.currentState!.closeDrawer();
  }
  void navigateProfilePage(){
    Get.toNamed(AppRoutes.profile);
  }
  void navigateSettingPage(){
    Get.toNamed(AppRoutes.setting);
  }
  void navigateOrderHistoryPage(){
    Get.toNamed(AppRoutes.orderHistory);
  }
}