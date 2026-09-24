import 'dart:io';

import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import 'cubit/conversation_room_cubit.dart';
import 'widgets/message_bubble.dart';
import 'widgets/message_composer.dart';

/// Halaman ruang percakapan (P5.3/P5.4, F-18, PRD §5.9).
class ConversationRoomPage extends StatelessWidget {
  final String otherUserId;
  final String? otherUsername;
  final String? relatedAdType;
  final String? relatedAdId;

  const ConversationRoomPage({
    super.key,
    required this.otherUserId,
    this.otherUsername,
    this.relatedAdType,
    this.relatedAdId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ConversationRoomCubit>()
        ..initialize(
          otherUserId,
          relatedAdType: relatedAdType,
          relatedAdId: relatedAdId,
        ),
      child: _ConversationRoomView(otherUsername: otherUsername),
    );
  }
}

class _ConversationRoomView extends StatefulWidget {
  final String? otherUsername;

  const _ConversationRoomView({this.otherUsername});

  @override
  State<_ConversationRoomView> createState() => _ConversationRoomViewState();
}

class _ConversationRoomViewState extends State<_ConversationRoomView> {
  final _picker = ImagePicker();

  Future<void> _pickPhoto(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Kamera'),
              onTap: () => Navigator.pop(sheetContext, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Galeri'),
              onTap: () => Navigator.pop(sheetContext, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source == null || !context.mounted) return;

    final picked = await _picker.pickImage(source: source, imageQuality: 90);
    if (picked == null || !context.mounted) return;

    context.read<ConversationRoomCubit>().sendPhoto(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(widget.otherUsername ?? 'Chat'),
        actions: [
          BlocBuilder<ConversationRoomCubit, ConversationRoomState>(
            buildWhen: (previous, current) =>
                previous.isEnded != current.isEnded,
            builder: (context, state) {
              if (state.isEnded) return const SizedBox.shrink();
              return TextButton(
                onPressed: () => _confirmEndConversation(context),
                child: const Text(
                  'Akhiri',
                  style: TextStyle(color: AppColors.error),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ConversationRoomCubit, ConversationRoomState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage &&
            current.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isFailure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat percakapan.',
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: AppSpacing.paddingVerticalSm,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return MessageBubble(
                      message: message,
                      isMine: message.senderId == state.currentUserId,
                    );
                  },
                ),
              ),
              MessageComposer(
                isSending: state.isSending,
                isEnded: state.isEnded,
                onSendText: (text) =>
                    context.read<ConversationRoomCubit>().sendText(text),
                onSendLocation: () =>
                    context.read<ConversationRoomCubit>().sendCurrentLocation(),
                onPickPhoto: () => _pickPhoto(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _confirmEndConversation(BuildContext context) async {
    final cubit = context.read<ConversationRoomCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Akhiri Percakapan?'),
        content: const Text(
          'Percakapan ini akan diakhiri dan tidak bisa mengirim pesan baru.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Akhiri'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await cubit.endConversation();
    }
  }
}
