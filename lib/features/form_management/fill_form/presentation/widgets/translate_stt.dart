import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_cubit.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_state.dart';
import 'package:mobeen/features/translate/presentation/widgets/mic_button.dart';

class SpeakAndTranslateSection extends StatelessWidget {
  const SpeakAndTranslateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TranslateCubit>();

    return BlocConsumer<TranslateCubit, TranslateState>(
      listener: (context, state) {
        if (state is TranslateErrorState) {
          context.showSnackBar(state.message);
        }
      },

      builder: (context, state) {
        bool isRecording = false;
        bool isLoading = false;

        String textToShow = "اضغط مطولاً للتحدث";

        if (state is TranslateLoadingState) {
          isLoading = true;
          textToShow = "جاري المعالجة...";
        }
        if (state is TranslateRecordingState) {
          isRecording = state.start;
          textToShow = "جاري التسجيل...";
        }
        if (state is TranslateSuccessState) {
          textToShow = state.result.translatedText.isEmpty
              ? "لا يوجد نص مترجم"
              : state.result.translatedText;
        }
        if (state is TranslateErrorState) {
          textToShow = state.message;
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(8),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  constraints: const BoxConstraints(minHeight: 120),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            textToShow,
                            textAlign: TextAlign.center,

                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(height: 1.6),
                          ),
                  ),
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.center,

                  child: MicButton(
                    isRecording: isRecording,
                    onStart: cubit.startRecording,
                    onStop: cubit.stopRecording,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
