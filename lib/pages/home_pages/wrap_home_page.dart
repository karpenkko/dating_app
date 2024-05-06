import 'package:dating_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: navigationShell,
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: navigationShell.currentIndex,
    //     items: const [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //       BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shope'),
    //     ],
    //     onTap: _onTap,
    //   ),
    // );
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}


class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
      ),
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin:  const EdgeInsets.only(left: 20, top: 2),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 0 ? AppColor.whiteColor : Colors.transparent,
                ),
                child: SvgPicture.asset(
                  'assets/icons/nav_home.svg',
                  height: 22,
                  colorFilter: currentIndex == 0 ? const ColorFilter.mode(AppColor.purpleColor, BlendMode.srcIn) : const ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1 ? AppColor.whiteColor : Colors.transparent,
                ),
                child: SvgPicture.asset(
                  'assets/icons/nav_message.svg',
                  height: 18,
                  colorFilter: currentIndex == 1 ? const ColorFilter.mode(AppColor.purpleColor, BlendMode.srcIn) : const ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin:  const EdgeInsets.only(right: 20, top: 3),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 2 ? AppColor.whiteColor : Colors.transparent,
                ),
                child: SvgPicture.asset(
                  'assets/icons/nav_profile.svg',
                  height: 22,
                  colorFilter: currentIndex == 2 ? const ColorFilter.mode(AppColor.purpleColor, BlendMode.srcIn) : const ColorFilter.mode(AppColor.whiteColor, BlendMode.srcIn),
                ),
              ),
              label: '',
            ),
          ],
          unselectedFontSize: 8,
          selectedFontSize: 8,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColor.purpleColor,
          selectedItemColor: AppColor.purpleColor,
          unselectedItemColor: AppColor.whiteColor.withOpacity(0.8),
        ),
      ),
    );
  }
}