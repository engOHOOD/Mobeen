import 'package:any_image/any_image.dart';
import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';

class OrganizationCardWidget extends StatelessWidget {
  const OrganizationCardWidget({super.key, required this.organization});
  final ViewOrganizationEntity organization;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: .all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.card),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnyImage(
                source: organization.organizationLogo ?? '',
                fit: .contain,
                placeholder: Center(child: CircularProgressIndicator()),
                errorWidget: Icon(Icons.broken_image),
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.card),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                organization.name,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
