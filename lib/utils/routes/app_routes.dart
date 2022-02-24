import 'package:flutter/material.dart';
import 'package:india_today_demo/presentation/pages/ask_question_screen.dart';
import 'package:india_today_demo/presentation/pages/friend_family_profile_screen.dart';
import 'package:india_today_demo/presentation/pages/update_edit_profile_screen.dart';

class AppRoutes {
  static String getInitialRoute() {
    return UpdateEditProfileScreen.id;
  }

  static Route<dynamic>? generateRoutes(RouteSettings? routeSettings) {
    final args = routeSettings?.arguments;

    switch (routeSettings?.name) {
      case AskQuestionScreen.id:
        return MaterialPageRoute(
          builder: (context) => const AskQuestionScreen(),
        );
      case FrindFamilyProfileScreen.id:
        return MaterialPageRoute(
          builder: (context) => const FrindFamilyProfileScreen(),
        );
      case UpdateEditProfileScreen.id:
        return MaterialPageRoute(
          builder: (context) => const UpdateEditProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const AskQuestionScreen(),
        );
    }
  }
}
