import 'package:designsystems/designsystems.dart';
import 'package:flutter/material.dart';

/// Bar kirim pesan (F-19, PRD §5.9): teks, tombol lokasi, tombol foto.
class MessageComposer extends StatefulWidget {
  final ValueChanged<String> onSendText;
  final VoidCallback onSendLocation;
  final VoidCallback onPickPhoto;
  final bool isSending;
  final bool isEnded;

  const MessageComposer({
    super.key,
    required this.onSendText,
    required this.onSendLocation,
    required this.onPickPhoto,
    required this.isSending,
    required this.isEnded,
  });

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_controller.text.trim().isEmpty) return;
    widget.onSendText(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEnded) {
      return Container(
        padding: AppSpacing.paddingAllMd,
        color: AppColors.background,
        child: Text(
          'Percakapan ini sudah berakhir.',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: AppSpacing.paddingAllSm,
        child: Row(
          children: [
            IconButton(
              onPressed: widget.isSending ? null : widget.onPickPhoto,
              icon: const Icon(Icons.image_outlined),
            ),
            IconButton(
              onPressed: widget.isSending ? null : widget.onSendLocation,
              icon: const Icon(Icons.location_on_outlined),
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _submit(),
                decoration: const InputDecoration(
                  hintText: 'Tulis pesan...',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.xs),
            widget.isSending
                ? const Padding(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : IconButton(
                    onPressed: _submit,
                    icon: const Icon(Icons.send, color: AppColors.primary),
                  ),
          ],
        ),
      ),
    );
  }
}
