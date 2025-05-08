import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:flutter_task_catalift/utils/dimens.dart';
import 'package:flutter_task_catalift/utils/icons.dart';
import 'package:flutter_task_catalift/utils/text_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            selectedIcon: AppIcons.homeSelected, // Material Icon
            unselectedIcon: AppIcons.homeUnselected, // Material Icon
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            selectedIcon: AppIcons.exploreSelected, // Material Icon
            unselectedIcon: AppIcons.exploreUnselected, // Material Icon
            label: 'Explore Mentors',
            index: 1,
          ),
          _buildNavItem(
            selectedIcon: AppIcons.coursesSelected, // Material Icon
            unselectedIcon: AppIcons.coursesUnselected, // Material Icon
            label: 'Courses',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData selectedIcon,
    required IconData unselectedIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor = isSelected ? AppColors.accentColor : AppColors.iconColorLight.withOpacity(0.7);

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: AppColors.accentColor.withOpacity(0.2),
        highlightColor: AppColors.accentColor.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( // Using Material Icons from AppIcons
              isSelected ? selectedIcon : unselectedIcon,
              size: AppDimens.iconSizeLarge,
              color: itemColor,
            ),
            const SizedBox(height: AppDimens.paddingSmall - 2),
            Text(
              label,
              style: AppTextStyles.bottomNavLabel.copyWith(color: itemColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
