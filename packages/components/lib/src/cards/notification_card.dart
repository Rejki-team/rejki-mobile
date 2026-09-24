import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:designsystems/designsystems.dart';

enum NotificationType {
  applicationAccepted,
  jobApplication,
  usedGoods,
  training,
  worker,
  // Extended types from API notification types
  contactApproved,
  contactDeclined,
  bidApproved,
  bidDeclined,
  trainingApproved,
  trainingRejected,
  enrollmentApproved,
  enrollmentRejected,
  verificationApproved,
  verificationRejected,
  jobSuspended,
  workerBanned,
  manual,
}

NotificationType notificationTypeFromString(String type) {
  switch (type) {
    case 'contact_approved':
      return NotificationType.contactApproved;
    case 'contact_declined':
      return NotificationType.contactDeclined;
    case 'bid_approved':
      return NotificationType.bidApproved;
    case 'bid_declined':
      return NotificationType.bidDeclined;
    case 'training_approved':
      return NotificationType.trainingApproved;
    case 'training_rejected':
      return NotificationType.trainingRejected;
    case 'enrollment_approved':
      return NotificationType.enrollmentApproved;
    case 'enrollment_rejected':
      return NotificationType.enrollmentRejected;
    case 'verification_approved':
      return NotificationType.verificationApproved;
    case 'verification_rejected':
      return NotificationType.verificationRejected;
    case 'job_suspended':
      return NotificationType.jobSuspended;
    case 'worker_banned':
      return NotificationType.workerBanned;
    case 'manual':
      return NotificationType.manual;
    default:
      return NotificationType.manual;
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeText;
  final NotificationType type;
  final bool isUnread;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.timeText,
    required this.type,
    this.isUnread = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isUnread
                ? AppColors.availabilityBadgeBorder
                : AppColors.border,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIconContainer(),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          title,
                          style: AppTypography.labelMedium.copyWith(
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.iconClock,
                            width: 14,
                            height: 14,
                            colorFilter: const ColorFilter.mode(
                              AppColors.textSecondary,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            timeText,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isUnread)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    Color bgColor;
    Color iconColor;
    String iconPath;

    switch (type) {
      case NotificationType.applicationAccepted:
      case NotificationType.worker:
      case NotificationType.contactApproved:
      case NotificationType.contactDeclined:
      case NotificationType.workerBanned:
        bgColor = AppColors.userIconWrapperBg;
        iconColor = const Color(0xFF5E5CE6);
        iconPath = AppAssets.iconUser;
        break;
      case NotificationType.jobApplication:
      case NotificationType.bidApproved:
      case NotificationType.bidDeclined:
      case NotificationType.jobSuspended:
        bgColor = AppColors.serviceCardIconBgGreen;
        iconColor = AppColors.chatButtonGreen;
        iconPath = AppAssets.iconWork;
        break;
      case NotificationType.usedGoods:
        bgColor = AppColors.serviceCardIconBgPurple;
        iconColor = AppColors.iconPurple;
        iconPath = AppAssets.iconArchive;
        break;
      case NotificationType.training:
      case NotificationType.trainingApproved:
      case NotificationType.trainingRejected:
      case NotificationType.enrollmentApproved:
      case NotificationType.enrollmentRejected:
        bgColor = AppColors.serviceCardIconBgBlue;
        iconColor = AppColors.primary;
        iconPath = AppAssets.iconDocument;
        break;
      case NotificationType.verificationApproved:
      case NotificationType.verificationRejected:
        bgColor = AppColors.userIconWrapperBg;
        iconColor = AppColors.primary;
        iconPath = AppAssets.iconUserScan;
        break;
      case NotificationType.manual:
        bgColor = AppColors.serviceCardIconBgBlue;
        iconColor = AppColors.primary;
        iconPath = AppAssets.iconNotification;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
