import 'package:flutter/material.dart';
import 'package:india_today_demo/data/models/request/update_add_user_request/update_add_user_request.dart';
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
        UpdateAddUserRequest? uuid;
        if (args != null) {
          try {
            uuid = args as UpdateAddUserRequest;
          } catch (e) {}
        }
        return MaterialPageRoute(
          builder: (context) =>
              UpdateEditProfileScreen(updateAddUserRequest: uuid),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const AskQuestionScreen(),
        );
    }
  }
}
