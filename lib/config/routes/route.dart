import 'package:currency/Features/presentation/cubit/cubit.dart';
import 'package:currency/Features/presentation/screens/curency_screen.dart';
import 'package:currency/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency/injection.dart' as di;
class Routes {
  static const initRoute = '/';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.s1<AppCubit>(),
              child: const CurrencyScreen(),),
        );
      default:
        return undefinedRout();
    }
  }

  static Route<dynamic> undefinedRout() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Text(AppStrings.noRoute),
      ),
    );
  }
}
