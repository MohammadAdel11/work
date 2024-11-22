import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../global/constants.dart';
import '../controllers/trackingPageController.dart';
import '../themes/colors.dart';

class trackingPage extends StatelessWidget {
  const trackingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final trackingPageController controller =Get.put(trackingPageController(),permanent: true);
    return Scaffold(
      drawer: drawer(controller),
      key: controller.scaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            child: map(controller),
            width: Get.width,
            height: Get.height,
          ),
          Positioned(
            top: Get.height * 0.05,
            right: Get.width * 0.04,
            child: IconButton(
                style: ButtonStyle(
                    backgroundColor:
                    WidgetStatePropertyAll(ThemeColors.goldColor)),
                onPressed: controller.openDrawer,
                icon: Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.black,
                )),
          )
        ],
      ),
    );
  }

  Widget map(trackingPageController controller) {
    return FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
            initialCenter: LatLng(32.06502, 35.02554),
            initialZoom: 15,
            interactionOptions:
            InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          Obx(() {
            print(controller.markers);
            return MarkerLayer(markers: controller.markers);
          })
        ]);
  }

  Widget drawer(trackingPageController controller) {
    return Container(
      width: Get.width * 0.666,
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(constants.appName),
                  IconButton(
                      onPressed: controller.closeDrawer,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ThemeColors.goldColor,
                      ))
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              ListTile(
                onTap: controller.navigateProfilePage,
                title: Text(
                  'الملف الشخصي',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                onTap: controller.navigateOrderHistoryPage,
                title: Text('سجل الطلبات'),
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                onTap: controller.navigateSettingPage,
                title: Text('الاعدادات'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}