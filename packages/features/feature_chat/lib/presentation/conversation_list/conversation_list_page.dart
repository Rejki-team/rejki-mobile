import 'package:components/components.dart';
import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'cubit/conversation_list_cubit.dart';
import 'widgets/conversation_tile.dart';

/// "Halaman daftar percakapan" (P5.2, F-18, PRD §5.9).
class ConversationListPage extends StatelessWidget {
  const ConversationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ConversationListCubit>()..loadConversations(),
      child: const _ConversationListView(),
    );
  }
}

class _ConversationListView extends StatelessWidget {
  const _ConversationListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('Chat')),
      body: BlocBuilder<ConversationListCubit, ConversationListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isFailure) {
            return AppErrorState(
              description: state.errorMessage ?? 'Gagal memuat percakapan.',
              onRetry: () =>
                  context.read<ConversationListCubit>().loadConversations(),
            );
          }
          if (state.isEmpty) {
            return AppEmptyState(
              title: 'Belum Ada Percakapan',
              description:
                  'Mulai chat dengan menghubungi pengiklan atau pekerja dari halaman detail iklan.',
            );
          }
          return RefreshIndicator(
            onRefresh: () =>
                context.read<ConversationListCubit>().loadConversations(),
            child: ListView.separated(
              itemCount: state.conversations.length,
              separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final conversation = state.conversations[index];
                final otherUserId = conversation.otherUser?.id;
                return ConversationTile(
                  conversation: conversation,
                  onTap: () {
                    if (otherUserId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profil pengguna tidak ditemukan'),
                        ),
                      );
                      return;
                    }
                    context.push('/chat/$otherUserId');
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
