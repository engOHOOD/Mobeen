import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_cubit.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_state.dart';
import 'package:mobeen/features/form_management/export_data/presentation/widgets/export_action_button.dart';
import 'package:mobeen/features/form_management/export_data/presentation/widgets/export_date_pickers.dart';
import 'package:mobeen/features/form_management/export_data/presentation/widgets/export_forms_list.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class ExportDataFeatureScreen extends HookWidget {
  const ExportDataFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;

    final cubit = context.read<ExportDataCubit>();

    final hasLoaded = useState(false);

    if (!hasLoaded.value) {
      useEffect(() {
        cubit.getExportDataMethod();
        hasLoaded.value = true;
        return null;
      }, []);
    }

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<ExportDataCubit, ExportDataState>(
          listener: (context, state) {
            if (state is ExportDataExportSuccessState) {
              context.showSnackBar('تم تصدير ملف الاكسل بنجاح');
            }
            if (state is ExportDataErrorState) {
              context.showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            if (state is ExportDataLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ExportDataErrorState && cubit.forms.isEmpty) {
              return Center(child: Text(state.message));
            }
            if (cubit.forms.isEmpty) {
              return Center(child: Text('لا توجد نماذج متاحة حالياً'));
            }

            return Column(
              children: [
                SectionTitle(title: 'تصدير البيانات'),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExportFormsList(forms: cubit.forms, cubit: cubit),
                  ),
                ),
                Gap(12),
                ExportDatePickers(cubit: cubit),
                Gap(16),
                ExportActionButton(cubit: cubit),
              ],
            );
          },
        ),
      ),
    );
  }
}
