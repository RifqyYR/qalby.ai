import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/common/app_route.dart';
import 'package:myproject/common/cubit/nav_cubit.dart';
import 'package:myproject/common/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.chat_outlined,
    Icons.mosque_outlined,
    Icons.settings_outlined,
  ];

  final List<String> labels = ["Home", "Chat", "Worship", "Settings"];

  final List<String> routes = [
    AppRoute.home,
    AppRoute.chat,
    AppRoute.worship,
    AppRoute.setting,
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<NavCubit>().state;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.grey, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(icons.length, (index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              if (selectedIndex != index) {
                context.read<NavCubit>().updateIndex(index);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  routes[index],
                  (route) => false,
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[index],
                  color:
                      isSelected
                          ? AppColors.textColor
                          : AppColors.textSecondaryColor,
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  labels[index],
                  style: TextStyle(
                    color:
                        isSelected
                            ? AppColors.textColor
                            : AppColors.textSecondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
