import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/utils/colors.dart';
import 'package:flutter_task_catalift/utils/dimens.dart';
import 'package:flutter_task_catalift/utils/icons.dart';
import 'package:flutter_task_catalift/utils/text_styles.dart';
import '../models/mentor_model.dart';

class MentorCard extends StatelessWidget {
  final Mentor mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    Color compatibilityColor;
    if (mentor.compatibility >= 90) {
      compatibilityColor = AppColors.compatibilityGood;
    } else if (mentor.compatibility >= 70) {
      compatibilityColor = AppColors.compatibilityMedium;
    } else {
      compatibilityColor = AppColors.compatibilityLow;
    }
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimens.marginLarge, vertical: AppDimens.marginSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
        side: BorderSide(color: AppColors.borderColor.withOpacity(0.5), width: 1),
      ),
      color: AppColors.cardBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: AppDimens.profileImageRadius,
                  backgroundColor: AppColors.borderColor,
                  child: mentor.imageUrl.isEmpty
                      ? Text(
                          mentor.name.isNotEmpty ? mentor.name[0].toUpperCase() : 'M',
                          style: AppTextStyles.headline2.copyWith(color: AppColors.primaryColor),
                        )
                      : ClipOval(
                          child: Image.asset( 
                            mentor.imageUrl,
                            width: AppDimens.profileImageSize,
                            height: AppDimens.profileImageSize,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                               return Text(
                                mentor.name.isNotEmpty ? mentor.name[0].toUpperCase() : 'M',
                                style: AppTextStyles.headline2.copyWith(color: AppColors.primaryColor),
                              );
                            },
                          ),
                        ),
                ),
                const SizedBox(width: AppDimens.paddingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon( 
                            AppIcons.star,
                            size: AppDimens.iconSizeSmall,
                            color: AppColors.starColor,
                          ),
                          const SizedBox(width: AppDimens.paddingSmall),
                          Text(
                            mentor.rating.toString(),
                            style: AppTextStyles.bodyTextSmall.copyWith(
                                color: AppColors.textColorPrimary, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.paddingMedium, vertical: AppDimens.paddingSmall - 2),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
                              border: Border.all(color: AppColors.accentColor, width:0.5)
                            ),
                            child: Text(
                              mentor.sector,
                              style: AppTextStyles.tagText.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimens.paddingSmall),
                      Text(
                        mentor.name,
                        style: AppTextStyles.mentorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.paddingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoChip(
                    iconData: AppIcons.calendar, text: mentor.experience), 
                _buildInfoChip(iconData: AppIcons.briefcase, text: mentor.role), 
                _buildInfoChip(
                    iconData: AppIcons.reviews, 
                    text: '${mentor.reviews} Reviews'),
              ],
            ),
            const SizedBox(height: AppDimens.paddingMedium),
            Text(
              mentor.description,
              style: AppTextStyles.bodyTextSmall.copyWith(height: 1.4),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimens.paddingLarge),
            Text(
              '${mentor.compatibility}% compatibility',
              style: AppTextStyles.compatibilityText.copyWith(color: compatibilityColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData iconData, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon( 
          iconData,
          size: AppDimens.iconSizeSmall,
          color: AppColors.iconColorDark,
        ),
        const SizedBox(width: AppDimens.paddingSmall),
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.caption.copyWith(color: AppColors.textColorSecondary),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}