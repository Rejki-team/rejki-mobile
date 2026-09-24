import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

/// Satu baris "Halaman daftar percakapan" (P5.2, PRD §5.9): foto profil,
/// nama, ringkasan pesan terakhir, indikator belum dibaca.
class ConversationTile extends StatelessWidget {
  final ConversationSummaryEntity conversation;
  final VoidCallback onTap;

  const ConversationTile({
    super.key,
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final otherUser = conversation.otherUser;
    final lastMessage = conversation.lastMessage;
    final hasUnread = conversation.hasUnread;

    return ListTile(
      onTap: onTap,
      contentPadding: AppSpacing.paddingHorizontalMd,
      leading: _buildAvatar(otherUser?.avatar),
      title: Text(
        otherUser?.username ?? 'Pengguna',
        style: AppTypography.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        _lastMessagePreview(lastMessage),
        style: hasUnread
            ? AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              )
            : AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: hasUnread
          ? Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }

  Widget _buildAvatar(String? avatarPath) {
    const size = 48.0;
    if (avatarPath == null || avatarPath.isEmpty) {
      return const CircleAvatar(
        radius: size / 2,
        backgroundColor: AppColors.background,
        child: Icon(Icons.person_outline, color: AppColors.textSecondary),
      );
    }
    return AuthenticatedNetworkImage(
      imageUrl: ApiConfig.buildImageUrl(avatarPath),
      width: size,
      height: size,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(size / 2),
    );
  }

  String _lastMessagePreview(MessageEntity? message) {
    if (message == null) return 'Belum ada pesan';
    if (message.isLocation) return '📍 Membagikan lokasi';
    if (message.isPhoto) return '📷 Foto';
    return message.content ?? '';
  }
}
