import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_cubit.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_state.dart';
import 'package:mobeen/features/translate/presentation/widgets/detected_language_card.dart';
import 'package:mobeen/features/translate/presentation/widgets/translate_input_card.dart';
import 'package:mobeen/features/translate/presentation/widgets/translate_result_card.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class TranslateFeatureScreen extends HookWidget {
  const TranslateFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TranslateCubit>();

    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;

    final textController = useTextEditingController();

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: BlocListener<TranslateCubit, TranslateState>(
        listener: (context, state) {
          if (state is TranslateErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message.toString())));
          }
          if (state is TranslateSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Translation done")));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: BlocBuilder<TranslateCubit, TranslateState>(
              builder: (context, state) {
                final isRecording = state is TranslateRecordingState;
                final isLoading = state is TranslateLoadingState;
                final translatedText = state is TranslateSuccessState
                    ? state.result.translatedText
                    : "";
                final detectedLanguage = state is TranslateSuccessState
                    ? state.result.detectedLanguage
                    : "—";
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SectionTitle(title: 'الترجمة الفورية'),
                            DetectedLanguageCard(
                              language: detectedLanguage,
                              onReset: cubit.resetSession,
                            ),
                            Gap(15),
                            TranslateResultCard(
                              isLoading: isLoading,
                              text: translatedText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TranslateInputCard(
                      controller: textController,
                      onSend: () {
                        if (textController.text.isNotEmpty) {
                          cubit.sendText(textController.text);
                          FocusScope.of(context).unfocus();
                        }
                      },
                      isRecording: isRecording,
                      onStartRecord: cubit.startRecording,
                      onStopRecord: cubit.stopRecording,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}