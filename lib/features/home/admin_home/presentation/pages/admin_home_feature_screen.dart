import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/widgets/cards/statics_card_web.dart';

class AdminHomeFeatureScreen extends StatelessWidget {
  const AdminHomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1100),
            child: Padding(
              padding: EdgeInsets.all(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondary, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/hujaj.jpg',
                          height: 200,
                          width: 500,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image);
                          },
                        ),
                      ),
                    ),
                  ),
                  Gap(40),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    spacing: 15,
                    children: [
                      Expanded(child: StaticsCardWeb(title: 'عدد الشركات', value: '8')),
                      Expanded(child: StaticsCardWeb(title: 'عدد مدراء النظام', value: '12')),
                      Expanded(child: StaticsCardWeb(title: 'عدد المستخدمين', value: '43')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
