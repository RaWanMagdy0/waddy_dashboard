import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waddy_dashboard/core/di/di.dart';
import 'package:waddy_dashboard/core/routes/app_routes.dart';
import 'package:waddy_dashboard/core/routes/page_route_name.dart';
import 'package:waddy_dashboard/core/styles/colors/app_colors.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAhXTXFkCfyLnvQGSjrINL7Ig5qXpd4tUU",
      authDomain: "waddy-5908d.firebaseapp.com",
      projectId: "waddy-5908d",
      storageBucket: "waddy-5908d.firebasestorage.app",
      messagingSenderId: "1048305045031",
      appId: "1:1048305045031:web:3d6138706ed2a650d4c802",
      measurementId: "G-VTKQWENMNH",
    ),
  );

  runApp(
    MultiProvider(
      providers: [BlocProvider(create: (context) => getIt<AddOrderCubit>())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: PageRouteName.homeScreen,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          title: 'Waddy Dashboard',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kWhite,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.kWhite),
          ),
        );
      },
    );
  }
}
