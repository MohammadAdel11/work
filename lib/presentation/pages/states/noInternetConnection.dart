
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.21,),
              Image.asset("lib/core/utils/images/no-wifi.png",width: MediaQuery.sizeOf(context).width*0.5,color: Colors.red,),
              Text("لا يوجد اتصال بالانترنت",style: Theme.of(context).textTheme!.bodyMedium,),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.3,),
              Text("قم بالأتصال بالانترنت, وسوف يتم تحويلك مباشرة الى البرنامج",style: Theme.of(context).textTheme!.bodyMedium,),
            ],
          ),
        ),
      ),
    );
  }
}
