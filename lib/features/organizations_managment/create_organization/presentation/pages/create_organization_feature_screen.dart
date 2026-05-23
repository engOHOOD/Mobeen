import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/utils/validators.dart';
import 'package:mobeen/core/widgets/buttons/custom_submit_button.dart';
import 'package:mobeen/core/widgets/cards/custom_container_box.dart';
import 'package:mobeen/core/widgets/fields/custom_text_field.dart';
import 'package:mobeen/core/widgets/headers/web_header.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/cubit/create_organization_cubit.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/cubit/create_organization_state.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/widgets/custom_section_title.dart';
import 'package:sizer/sizer.dart';

class CreateOrganizationFeatureScreen extends HookWidget {
  const CreateOrganizationFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateOrganizationCubit>();

    final pickedImageBytes = useState<Uint8List?>(null);
    final organizationNameController = useTextEditingController();
    final organizationEmailController = useTextEditingController();
    final nationalAddressController = useTextEditingController();
    final nameController = useTextEditingController();
    final adminEmailController = useTextEditingController();
    final phoneController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: BlocBuilder<CreateOrganizationCubit, CreateOrganizationState>(
            builder: (context, state) {
              if (state is CreateOrganizationInitialState ||
                  state is CreateOrganizationSuccessState ||
                  state is CreateOrganizationLoadingState) {
                return Column(
                  children: [
                    WebHeader(
                      title: "الرجاء إدخال معلومات الشركة ومدير النظام",
                      buttonTitle: "الرجوع",
                      onPressed: () => context.pop(),
                    ),
                    Gap(10.sh),
                    Expanded(
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                            child: CustomContainerBox(
                              maxWidth: 90,
                              maxHeight: 30,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// COMPANY SECTION
                                  CustomSectionTitle(title: "معلومات الشركة"),
                                  const Gap(10),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: AppColors.background,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.disabled,
                                      ),
                                    ),

                                    child: InkWell(
                                      onTap: () async {
                                        final picker = ImagePicker();

                                        final image = await picker.pickImage(
                                          source: ImageSource.gallery,
                                          imageQuality: 70,
                                        );

                                        if (image != null) {
                                          final bytes = await image
                                              .readAsBytes();
                                          pickedImageBytes.value = bytes;
                                        }
                                      },
                                      child: pickedImageBytes.value != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.memory(
                                                pickedImageBytes.value!,
                                                fit: .contain,
                                              ),
                                            )
                                          : const Icon(Icons.camera_alt),
                                    ),
                                  ),
                                  const Gap(30),
                                  GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 5,
                                    children: [
                                      CustomTextField(
                                        title: "الاسم",
                                        controller: organizationNameController,
                                        hintText: '',
                                      ),
                                      CustomTextField(
                                        title: "البريد الإلكتروني",
                                        controller: organizationEmailController,
                                        hintText: '',
                                        validator: Validators.validateRequired,
                                      ),
                                      CustomTextField(
                                        title: "العنوان الوطني",
                                        controller: nationalAddressController,
                                        hintText: '',
                                      ),
                                    ],
                                  ),
                                  const Gap(20),
                                  CustomSectionTitle(
                                    title: "معلومات مدير النظام",
                                  ),
                                  const Gap(10),
                                  GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 5,
                                    children: [
                                      CustomTextField(
                                        title: "الإسم",
                                        controller: nameController,
                                        hintText: "الإسم",
                                      ),
                                      CustomTextField(
                                        title: "البريد الإلكتروني",
                                        controller: adminEmailController,
                                        hintText: "البريد الإلكتروني",
                                      ),
                                      CustomTextField(
                                        title: "رقم الجوال",
                                        controller: phoneController,
                                        hintText: "رقم الجوال",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(child: Gap(20)),

                          /// BUTTON
                          SliverToBoxAdapter(
                            child: CustomSubmitButton(
                              title: state is CreateOrganizationLoadingState
                                  ? "جاري الإضافة..."
                                  : "إضافة",
                              onPressed: state is CreateOrganizationLoadingState
                                  ? null
                                  : () {
                                      cubit.getCreateOrganizationMethod(
                                        email: organizationEmailController.text,
                                        organizationName:
                                            organizationNameController.text,
                                        nationalAddress:
                                            nationalAddressController.text,
                                        organizationLogoBytes:
                                            pickedImageBytes.value,

                                        name: nameController.text,
                                        adminemail: adminEmailController.text,
                                        phone: phoneController.text,
                                      );

                                      context.showSnackBar(
                                        'تم إضافة المستخدم بنجاح',
                                      );
                                    },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
