import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'location_message_content.dart';
import 'photo_message_content.dart';

/// Satu bubble pesan (F-19, PRD §5.9) — teks/lokasi/foto.
class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  final bool isMine;

  const MessageBubble({super.key, required this.message, required this.isMine});

  @override
  Widget build(BuildContext context) {
    final bgColor = isMine ? AppColors.primary : AppColors.background;
    final textColor = isMine ? AppColors.textOnPrimary : AppColors.textPrimary;
    final maxWidth = MediaQuery.of(context).size.width * 0.75;

    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.xxs,
          horizontal: AppSpacing.md,
        ),
        padding: message.isText
            ? AppSpacing.paddingAllSm
            : const EdgeInsets.all(AppSpacing.xxs),
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        child: _buildContent(textColor),
      ),
    );
  }

  Widget _buildContent(Color textColor) {
    if (message.isLocation && message.lat != null && message.lng != null) {
      return LocationMessageContent(lat: message.lat!, lng: message.lng!);
    }
    if (message.isPhoto && message.photoObjectKey != null) {
      return PhotoMessageContent(objectKey: message.photoObjectKey!);
    }
    return Text(
      message.content ?? '',
      style: AppTypography.bodyMedium.copyWith(color: textColor),
    );
  }
}
