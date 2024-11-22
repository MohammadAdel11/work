import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:herafi/global/constants.dart';
import 'package:herafi/presentation/routes/app_routes.dart';
import 'package:herafi/presentation/routes/initialPage.dart';
import 'package:herafi/presentation/themes/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await supabase.Supabase.initialize(
    url: 'https://vbfjfbdgupmnltcjanhl.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZiZmpmYmRndXBtbmx0Y2phbmhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk0OTM2MzQsImV4cCI6MjA0NTA2OTYzNH0.YGGiHIrhaljmmrkMeJhYgP_o2ebGvOdA2gf7_lK07ng',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    handleStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,widget) {
        return GetMaterialApp(
          theme: themeData,
          debugShowCheckedModeBanner: false,
          locale: Locale("ar"),
          getPages: AppRoutes.pages,
          title: constants.appName,
          initialRoute: AppRoutes.waitingPage,
        );
      }
    );
  }

  void handleStatus(){
    CombineLatestStream.combine2<User?, List<ConnectivityResult>, List<dynamic>>(
      FirebaseAuth.instance.authStateChanges(),
      Connectivity().onConnectivityChanged,
          (User? user, List<ConnectivityResult> connectivity) {
        return [user, connectivity]; // This returns a list of the user and connectivity result.
      },
    ).listen(
          (snapshot){
        initialPage().handleInitialPage(snapshot);},
    );
  }
}
