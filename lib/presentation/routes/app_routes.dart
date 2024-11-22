import 'package:get/get.dart';
import 'package:herafi/presentation/bindings/chatsBinding/chatPageBinding.dart';
import 'package:herafi/presentation/bindings/orderHistoryPageBinding.dart';
import 'package:herafi/presentation/bindings/profilePageBinding.dart';
import 'package:herafi/presentation/bindings/settingPageBinding.dart';
import 'package:herafi/presentation/bindings/smsVerificationBinding.dart';
import 'package:herafi/presentation/pages/authPages/PravicyPolicy.dart';
import 'package:herafi/presentation/pages/authPages/RegisterCustomer.dart';
import 'package:herafi/presentation/pages/authPages/authPage.dart';
import 'package:herafi/presentation/pages/orderHistoryPage.dart';
import 'package:herafi/presentation/pages/orderProcessPage/chatsPage.dart';
import 'package:herafi/presentation/pages/settingPage.dart';

import '../bindings/authBinding.dart';
import '../bindings/chatsBinding/chatbot_binding.dart';
import '../bindings/chatsBinding/chatsBinding.dart';
import '../bindings/homePageBinding.dart';
import '../bindings/introductionPageBinding.dart';
import '../pages/DiplomaScreen.dart';
import '../pages/account_screen.dart';
import '../pages/authPages/RegisterCraftsman.dart';
import '../pages/authPages/accountType.dart';
import '../pages/availability_screen.dart';
import '../pages/edit_profile_screen.dart';
import '../pages/homePage.dart';
import '../pages/authPages/introductionPage.dart';
import '../pages/orderProcessPage/Chatbot.dart';
import '../pages/orderProcessPage/chatPage.dart';
import '../pages/portfolio_screen.dart';
import '../pages/states/noInternetConnection.dart';
import '../pages/profilePage.dart';
import '../pages/authPages/smsVerificationPage.dart';
import '../pages/states/waiting.dart';

class AppRoutes {
  static const String home = '/';
  static const String auth = '/auth';
  static const String introduction = '/introduction';
  static const String smsVerification = '/smsVerification';
  static const String orderherafi = '/orderherafi';
  static const String profile = '/profile';
  static const String setting = '/setting';
  static const String orderHistory = '/orderHistory';
  static const String noInternetConnection='/noInternetConnection';
  static const String selectPointOnMap = '/selectPointOnMap';
  static const String waitingPage = '/waitingPage';
  static const String chatpage = '/chatPage';
  static const String chatspage = '/chatsPage';
  static const String chatbot = '/chatbot';
  static const String privacyPolicy = '/privacyPolicy';
  static const String registerRole = '/RegisterRole';
  static const String accountScreen = '/AccountScreen';
  static const String availabilityScreen = '/AvailabilityScreen';
  static const String diplomaScreen = '/DiplomaScreen';
  static const String editProfileScreen = '/EditProfileScreen';
  static const String portfolioScreen = '/PortfolioScreen';
  static const String ProfilePage = '/profilePage';
  static const String registerCustomer = '/RegisterCustomer';
  static const String registerCraftsman = '/RegisterCraftsman';
  static const String accountType = '/accountType';

  static List<GetPage> pages = [
    GetPage(
        name: home,
        page: () => homePage(),
        binding: homePageBinding()
    ),
    GetPage(
      name: introduction,
      page: () => introductionPage(),
      binding: introductionPageBinding(),
    ),
    GetPage(
      name: auth,
      page: () => authPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: smsVerification,
      page: () => smsVerificationPage(),
      binding: smsVerificationBinding(),
    ),
    GetPage(
      name: profile,
      page: () => profilePage(),
      binding: profilePageBinding(),
    ),
    GetPage(
      name: setting,
      page: () => settingPage(),
      binding: settingPageBinding(),
    ),
    GetPage(
      name: orderHistory,
      page: () => orderHistoryPage(),
      binding: orderHistoryPageBinding(),
    ),
    GetPage(
      name: noInternetConnection,
      page: () => NoInternetConnection(),
    ),
    GetPage(
      name: waitingPage,
      page: () => WaitingPage(),
    ),

    GetPage(
      name: chatpage,
      page: () => chatPage(),
      binding: chatPageBinding()
    ),GetPage(
        name: chatspage,
        page: () => chatsPage(),
        binding: chatsPageBinding()
    ),
    GetPage(
      name: chatbot,
      page: () => ChatbotPage(),
      binding: ChatbotBinding(),
    ),

    GetPage(
      name: privacyPolicy,
      page: () => PrivacyPolicy(),
    ),
    GetPage(
      name: accountScreen,
      page: () => AccountScreen(),
    ),GetPage(
      name: diplomaScreen,
      page: () => DiplomaScreen(),
    ),GetPage(
      name: editProfileScreen,
      page: () => EditCraftsmanScreen(),
    ),GetPage(
      name: portfolioScreen,
      page: () => PortfolioScreen(),
    ),GetPage(
      name: ProfilePage,
      page: () => profilePage(),
    ),GetPage(
      name: availabilityScreen,
      page: () => AvailabilityScreen(),
    ),
    GetPage(
      name: accountType,
      page: () => AccountType(),
    ),
    GetPage(
      name: registerCraftsman,
      page: () => RegisterCraftsman(),
    ),
    // GetPage(
    //   name: registerCustomer,
    //   page: () => RegisterCustomer(),
    // ),

  ];
}
