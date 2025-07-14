import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddy_dashboard/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:waddy_dashboard/core/di/di.dart';
import 'package:waddy_dashboard/core/routes/page_route_name.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view/add_order_screen.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_cubit.dart';
import 'package:waddy_dashboard/home/presentation/home/home_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.addOrder:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AddOrderCubit>(),
            child: AddOrderScreen(),
          ),
        );
      case PageRouteName.signUp:
        return _handleMaterialPageRoute(widget: SignUpScreen());
      case PageRouteName.homeScreen:
        return _handleMaterialPageRoute(widget: HomeScreen());

      default:
        return _handleMaterialPageRoute(widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute({
    required Widget widget,
  }) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
