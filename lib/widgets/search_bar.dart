import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:flutter_task_catalift/utils/dimens.dart';
import 'package:flutter_task_catalift/utils/icons.dart';
import 'package:flutter_task_catalift/utils/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarWidget({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingLarge,
        vertical: AppDimens.paddingMedium,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyles.bodyText.copyWith(color: AppColors.textColorPrimary),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: AppTextStyles.bodyText.copyWith(color: AppColors.textColorSecondary),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(AppDimens.paddingMedium),
            child: Icon(
              AppIcons.search, // AppIcons
              size: AppDimens.iconSizeMedium,
              color: AppColors.iconColorDark,
            ),
          ),
          filled: true,
          fillColor: AppColors.searchBarFillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium, horizontal: AppDimens.paddingLarge),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusXLarge),
            borderSide: BorderSide(color: AppColors.borderColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusXLarge),
            borderSide: BorderSide(color: AppColors.borderColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusXLarge),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
