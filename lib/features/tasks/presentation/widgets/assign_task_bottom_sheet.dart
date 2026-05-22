import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';
import 'package:mobeen/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:mobeen/features/tasks/presentation/cubit/tasks_state.dart';

class AssignTaskBottomSheet extends HookWidget {
  final String locationId;

  const AssignTaskBottomSheet({super.key, required this.locationId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksCubit>();

    final selectedResearcher = useState<String?>(null);
    final selectedShift = useState<ShiftType?>(null);
    final selectedDate = useState<DateTime?>(null);
    final supervisorId = GetIt.I.get<UserService>().getUser?.id;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xffF8FAF9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xffD0E4D8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Gap(20),
              const Center(
                child: Text(
                  "تعيين مهمة",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff074D31),
                  ),
                ),
              ),

              const Gap(25),

              const Text(
                "اختر الباحث",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff074D31),
                ),
              ),

              const Gap(10),

              BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  final cubit = context.read<TasksCubit>();

                  return DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: cubit.researchers.map((researcher) {
                      return DropdownMenuItem(
                        value: researcher.id,
                        child: Text(researcher.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedResearcher.value = value;
                    },
                  );
                },
              ),

              const Gap(20),

              const Text(
                "المناوية",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff074D31),
                ),
              ),

              const Gap(10),

              DropdownButtonFormField<ShiftType>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: ShiftType.morning,
                    child: Text("صباحية"),
                  ),
                  DropdownMenuItem(
                    value: ShiftType.evening,
                    child: Text("مسائية"),
                  ),
                ],
                onChanged: (value) {
                  selectedShift.value = value;
                },
              ),

              const Gap(20),

              const Text(
                "التاريخ",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff074D31),
                ),
              ),

              const Gap(10),

              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xff074D31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    selectedDate.value = date;
                  },
                  child: Text(
                    selectedDate.value == null
                        ? "اختر التاريخ"
                        : selectedDate.value.toString().split(" ")[0],
                  ),
                ),
              ),

              const Gap(30),

              SizedBox(
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff074D31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    if (selectedResearcher.value == null ||
                        selectedShift.value == null ||
                        selectedDate.value == null) {
                      return;
                    }

                    await cubit.assignTask(
                      TasksEntity(
                        researcherId: selectedResearcher.value!,
                        supervisorId: supervisorId!,
                        locationId: locationId,
                        shift: selectedShift.value!,
                        taskDate: selectedDate.value!,
                      ),
                    );

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "تأكيد التعيين",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        );
      },
    );
  }
}
