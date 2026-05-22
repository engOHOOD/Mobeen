import 'package:flutter/material.dart';
import 'package:mobeen/features/translate/presentation/widgets/mic_button.dart';

class TranslateInputCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final bool isRecording;
  final VoidCallback onStartRecord;
  final VoidCallback onStopRecord;

  const TranslateInputCard({
    super.key,
    required this.controller,
    required this.onSend,
    required this.isRecording,
    required this.onStartRecord,
    required this.onStopRecord,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.right,
        style: theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: 'تحدث او اكتب ...',
          border: InputBorder.none,
          hintStyle: theme.textTheme.bodyMedium,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MicButton(
              isRecording: isRecording,
              onStart: onStartRecord,
              onStop: onStopRecord,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.send,
              color: theme.colorScheme.primary,
            ),
            onPressed: onSend,
          ),
        ),
      ),
    );
  }
}