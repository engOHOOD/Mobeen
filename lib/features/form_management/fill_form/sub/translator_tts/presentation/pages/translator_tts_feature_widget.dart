import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/services/translation_service.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/presentation/cubit/translator_tts_cubit.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/presentation/cubit/translator_tts_state.dart';

class TranslatorTtsFeatureWidget extends HookWidget {
  final String? initialText;

  const TranslatorTtsFeatureWidget({super.key, this.initialText});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: initialText ?? '');

    return BlocProvider(
      create: (_) =>
          TranslatorTtsCubit(translationService: GetIt.I<TranslationService>()),

      child: Builder(
        builder: (context) {
          final cubit = context.read<TranslatorTtsCubit>();

          return BlocListener<TranslatorTtsCubit, TranslatorTtsState>(
            listener: (context, state) {
              if (state is TranslatorErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            child: Column(
              mainAxisSize: MainAxisSize.min,
                        
              children: [
                BlocBuilder<TranslatorTtsCubit, TranslatorTtsState>(
                  builder: (context, state) {
                    String lang = "ar";
                        
                    if (state is TranslatorInitialState) {
                      lang = state.selectedLang;
                    }
                        
                    if (state is TranslatorLoadingState) {
                      lang = state.selectedLang;
                    }
                        
                    if (state is TranslatorSuccessState) {
                      lang = state.selectedLang;
                    }
                        
                    if (state is TranslatorErrorState) {
                      lang = state.selectedLang;
                    }
                        
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.translateAndSpeak(textController.text);
                          },
                          icon: Icon(Icons.volume_up_rounded),
                        ),
                        Gap(10),
                        
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: lang,
                        
                            items: const [
                              DropdownMenuItem(
                                value: "ar",
                                child: Text("Arabic"),
                              ),
                        
                              DropdownMenuItem(
                                value: "en",
                                child: Text("English"),
                              ),
                        
                              DropdownMenuItem(
                                value: "fr",
                                child: Text("French"),
                              ),
                        
                              DropdownMenuItem(
                                value: "es",
                                child: Text("Spanish"),
                              ),
                            ],
                        
                            onChanged: (value) {
                              if (value != null) {
                                cubit.changeLanguage(value);
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// Icon(Icons.keyboard_voice_rounded)