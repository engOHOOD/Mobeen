import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const MicButton({
    super.key,
    required this.isRecording,
    required this.onStart,
    required this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onStart,
      onLongPressUp: onStop,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isRecording
              ? Colors.red
              : Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.mic_rounded,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}