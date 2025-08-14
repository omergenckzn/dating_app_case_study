import 'package:auto_route/auto_route.dart';
import 'package:dating_app/core/router/app_router.gr.dart';
import 'package:dating_app/core/theme/dating_app_color.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

@RoutePage()
class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _selectedIndex = 0;
  final _routes = [
    const UsernameRoute(),
    const UsernameRoute(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    context.router.replaceAll([_routes[index]]);
  }

  @override
  Widget build(BuildContext context) {
    final lp = S.of(context);
    final colors = context.datingAppColor;

    final items = [
      _NavBarItem(
        filledIcon: IconlyBold.home,
        lineIcon: IconlyLight.home,
        label: lp.navBarHome,
      ),
      _NavBarItem(
        filledIcon: IconlyBold.profile,
        lineIcon: IconlyLight.profile,
        label: lp.navBarProfile,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: const AutoRouter(),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (i) {
            final isSelected = i == _selectedIndex;
            final icon = !isSelected ? items[i].lineIcon : items[i].filledIcon;
            final color = isSelected
                ? Colors.white.withValues(alpha: 1)
                : Colors.white.withValues(alpha: 1);
            return GestureDetector(
              onTap: () => _onItemTapped(i),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 28,
                    ),
                    8.23.horizontalSpace,
                    Text(
                      items[i].label,
                      style: TextStyle(color: color, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavBarItem {
  const _NavBarItem({
    required this.filledIcon,
    required this.lineIcon,
    required this.label,
  });
  final IconData filledIcon;
  final IconData lineIcon;
  final String label;
}
