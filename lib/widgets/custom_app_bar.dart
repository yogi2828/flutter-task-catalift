import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:flutter_task_catalift/utils/dimens.dart';
import 'package:flutter_task_catalift/utils/icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      title: Text(
        'CATALIFT',
      ),
      centerTitle: false, 
      actions: [
        IconButton(
          icon: const Icon( 
            AppIcons.person, 
            size: AppDimens.iconSizeLarge,
          ),
          tooltip: 'Profile',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile icon pressed (Material)')),
            );
          },
        ),
        // Notification Icon 
        IconButton(
          icon: const Icon(
            AppIcons.notifications,
            size: AppDimens.iconSizeLarge,
          ),
          tooltip: 'Notifications',
          onPressed: () {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Notifications icon pressed (Material)')),
            );
          },
        ),
        // Chat Icon 
        IconButton(
          icon: const Icon(
            AppIcons.chat,
            size: AppDimens.iconSizeLarge,
          ),
          tooltip: 'Chat',
          onPressed: () {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Chat icon pressed (Material)')),
            );
          },
        ),
        const SizedBox(width: AppDimens.paddingSmall),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
