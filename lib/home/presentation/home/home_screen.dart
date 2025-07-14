import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view/add_order_screen.dart';
import 'package:waddy_dashboard/home/presentation/home/widgets/side_bar_item.dart';
import 'package:waddy_dashboard/home/presentation/home_view/home_view_screen.dart';
import 'package:waddy_dashboard/home/presentation/profile/profile_screen.dart';
import 'package:waddy_dashboard/home/presentation/reports/report_screen.dart';
import 'package:waddy_dashboard/home/presentation/track_order/track_order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeView(),
    AddOrderScreen(),
    TrackOrder(),
    ReportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 240.sp,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F054C), Color(0xFF4B0082)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Waddy Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                SidebarItem(
                  icon: Icons.home,
                  label: 'Home',
                  selected: selectedIndex == 0,
                  onTap: () => setState(() => selectedIndex = 0),
                ),
                SidebarItem(
                  icon: Icons.plus_one_rounded,
                  label: 'add orders',
                  selected: selectedIndex == 1,
                  onTap: () => setState(() => selectedIndex = 1),
                ),
                SidebarItem(
                  icon: Icons.track_changes,
                  label: 'track orders',
                  selected: selectedIndex == 2,
                  onTap: () => setState(() => selectedIndex = 2),
                ),
                SidebarItem(
                  icon: Icons.report,
                  label: 'Reports',
                  selected: selectedIndex == 3,
                  onTap: () => setState(() => selectedIndex = 3),
                ),
                SidebarItem(
                  icon: Icons.person,
                  label: 'profile',
                  selected: selectedIndex == 4,
                  onTap: () => setState(() => selectedIndex = 4),
                ),
              ],
            ),
          ),
          Expanded(child: screens[selectedIndex]),
        ],
      ),
    );
  }
}
